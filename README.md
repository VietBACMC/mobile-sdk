# mobile-sdk

The Waivpay SDK provides a simple interface to allow an application to be built with access to Waivpay Web Services which provisions digital cards.

The main features provided by the SDK include:\
•	Information about the brands.\
•	Digital and physical card information.\
•	Purchasing a gift card.\
•	Adding a card to a digital wallet.\
•	Retrieving balance of a card.\
•	Retrieving transaction history of a card.\
•	Access to promotions and claims.\
•	User management.\
•	Promotions and cash back functionality.

## Documentation

Documentation of installation and usage can be found in the repository https://github.com/waivpay/mobile-sdk/raw/master/Waivpay-SDK.docx

## Access

This is a public repository hosted in the NPM registry of GitHub Packages. Personal Access Tokens are required for installation

## Installation

Ensure that you have setup your access to project via the .npmrc or .yarnrc files as per documentation in the repository https://github.com/waivpay/mobile-sdk/raw/master/Waivpay-SDK.docx

X.X.X needs to changed to the latest version.

Using NPM
```sh
npm install @waivpay/mobile-sdk@X.X.X
cd ios
pod install
```

Using YARN
```sh
yarn add @waivpay/mobile-sdk@X.X.X
cd ios
pod install
```

## Sample application

There is an example application in the repository under the Sample directory to show you the setup.\
You can download and run this application for a working example.\
See the read me notes for running the sample.

## Usage

Example on how to configure your application, see documentation for more APIs.

```js
import {setConfig} from "@waivpay/mobile-sdk/src/ApiCall";

import {AppConfig} from "@waivpay/mobile-sdk/src/Models/AppConfig";

…..

var appConfig = new AppConfig("client_id”, “client_secret”, “app_id”, “environment(staging|prod)");

setConfig(appConfig);
```
