import Foundation
import PassKit
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

struct KartaPaymentPassResponse: Codable {
    let activationData: String
    let ephemeralPublicKey: String
    let encryptedPassData: String
}

extension Data {
    func hexEncodedString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}
 
@objc(WaivpayKartaSdk)
class WaivpayKartaSdk: NSObject, PKAddPaymentPassViewControllerDelegate {
    
    var environment = "";
    var appid = "";
    var cardNumber = "";
    var delEmail = "";
    let host_staging = "https://webstores-staging.herokuapp.com/";
    let host_production = "https://webstores.herokuapp.com/";
    var token = "";
    
    @objc static func requiresMainQueueSetup() -> Bool {
        return false
    }
    
    func addPaymentPassViewController(_ controller: PKAddPaymentPassViewController, generateRequestWithCertificateChain certificates: [Data], nonce: Data, nonceSignature: Data, completionHandler handler: @escaping (PKAddPaymentPassRequest) -> Void) {

        _ = String(decoding: nonce, as: UTF8.self)
        _ = String(decoding: nonceSignature, as: UTF8.self)
        let nonce_hex = nonce.hexEncodedString()
        let nonceSignature_hex = nonceSignature.hexEncodedString()
        
        let cert_leaf = certificates[0].base64EncodedString();
        let cert_root = certificates[1].base64EncodedString();

        var host = "";
        if(environment == "staging")
        {
            host = host_staging + "api/apps/" + appid + "/cards/" + cardNumber + "/provision";
        }
        else if(environment == "prod")
        {
            host = host_production + "api/apps/" + appid + "/cards/" + cardNumber + "/provision";
        }

        let parameters = "{\n\"wallet_type\": \"ios\",\n\"delivery_email\": \"" + delEmail + "\",\n\"nonce\": \"" + nonce_hex + "\",\n\"nonce_signature\": \"" + nonceSignature_hex + "\",\n\"certificate_leaf\": \"" + cert_leaf + "\",\n\"certificate_root\": \"" + cert_root + "\"\n}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: host)!,timeoutInterval: Double.infinity)
        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            do {
            
            let decoder = JSONDecoder();
            let addResponse = try decoder.decode(KartaPaymentPassResponse.self, from: data);
            let paymentPassRequest = PKAddPaymentPassRequest();
                paymentPassRequest.activationData = Data(base64Encoded: addResponse.activationData, options: []);
                paymentPassRequest.ephemeralPublicKey = Data(base64Encoded: addResponse.ephemeralPublicKey, options: []);
                paymentPassRequest.encryptedPassData = Data(base64Encoded: addResponse.encryptedPassData, options: []);
            
            handler(paymentPassRequest);
            } catch {
                
            }

        }
        
        task.resume();

    }

    func addPaymentPassViewController(_ controller: PKAddPaymentPassViewController, didFinishAdding pass: PKPaymentPass?, error: Error?) {
        controller.dismiss(animated: true, completion: nil);
    }

    @objc(addCard:withB:withE:withD:withA:withT:withResolver:withRejecter:)
    func addCard(cardId: String, cardHolder: String, env: String, deliveryEmail: String, appId: String, accessToken: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        
         environment = env;
         appid = appId;
         cardNumber = cardId;
         delEmail = deliveryEmail;
        token = accessToken;
        
        let requestConfig = PKAddPaymentPassRequestConfiguration.init(encryptionScheme: PKEncryptionScheme.ECC_V2);
        requestConfig?.cardholderName = cardHolder;
        requestConfig?.primaryAccountSuffix = cardId;
        requestConfig?.paymentNetwork = PKPaymentNetwork(rawValue: "MASTERCARD");
        
        let passkitViewController = PKAddPaymentPassViewController.init(requestConfiguration: requestConfig!, delegate: self);
        DispatchQueue.main.async {
            var topMostViewController = UIApplication.shared.keyWindow?.rootViewController;
            while let presentedViewController = topMostViewController?.presentedViewController {
                topMostViewController = presentedViewController
            }
            topMostViewController?.present(passkitViewController!, animated:true, completion: nil);
        }
        resolve("ADDED");
    }
}
