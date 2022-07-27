package com.waivpaykartasdk;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;

@ReactModule(name = WaivpayKartaSdkModule.NAME)
public class WaivpayKartaSdkModule extends ReactContextBaseJavaModule {
    public static final String NAME = "WaivpayKartaSdk";

    public WaivpayKartaSdkModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    @NonNull
    public String getName() {
        return NAME;
    }

    @ReactMethod
    public void cardExists(String cardId, Promise promise) {
        promise.resolve(false);
    }

    public static native boolean nativeCardExists(String cardId);

    @ReactMethod
    public void checkIfReadyToPay(String jsonReq, String env,  Promise promise) {
        Log.e("TCHERE","checkIfReadyToPay");
        AddToWallet addToWallet = new AddToWallet();
        addToWallet.checkIfReadyToPay(jsonReq, env ,getCurrentActivity(),  promise);
        promise.resolve(false);
    }

    public static native boolean nativeCheckIfReadyToPay(String jsonReq, String env);

    @ReactMethod
    public void addCard(String cardId, String cardSuffix, String cardHolder, String env, String deliveryEmail, String appId, String accessToken, Promise promise) {
        try {
            AddToWallet addToWallet = new AddToWallet();
            addToWallet.addCardToWallet(cardId, cardSuffix, cardHolder, env, deliveryEmail, appId, accessToken, getCurrentActivity());
        } catch (Exception e) {
            e.printStackTrace();
        }
        promise.resolve(false);
    }

    public static native boolean nativeAddCard(String cardId, String cardSuffix, String cardHolder, String env, String deliveryEmail, String appId, String accessToken);

}
