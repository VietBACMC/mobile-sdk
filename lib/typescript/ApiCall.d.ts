import { AppConfig } from './Models/AppConfig';
import { Profile } from './Models/Profile';
import type { Order } from './Models/Order';
import { Brand } from './Models/Brand';
import { Balance } from './Models/Balance';
import { Catalogue } from './Models/Catalogue';
import { Transaction } from './Models/Transaction';
import { Card } from './Models/Card';
import { OrderResponse } from './Models/OrderResponse';
import { CardList } from './Models/CardList';
import { OrderList } from './Models/OrderList';
import { CardCallBackResponse } from './Models/CardCallBackResponse';
export declare function getConfig(): Promise<AppConfig>;
export declare function activateBeacon(): Promise<void>;
export declare function setConfig(appConfig: AppConfig): Promise<void>;
export declare function getAccessToken(): Promise<any>;
export declare function sendTwoFactor(mobile: string): Promise<unknown>;
export declare function verifyTwoFactor(code: string): Promise<unknown>;
export declare function getBrand(): Promise<Brand>;
export declare function getCatalogue(): Promise<Catalogue>;
export declare function getBalance(cardId: string): Promise<Balance>;
export declare function getTransactions(cardId: string): Promise<Transaction>;
export declare function getCardDetails(cardId: string, email: string, mobile: string): Promise<Card>;
export declare function createProfile(user: Profile): Promise<Profile>;
export declare function createOrder(order: Order): Promise<OrderResponse>;
export declare function searchCards(mobile: string): Promise<CardList>;
export declare function getProfile(userId: string): Promise<Profile>;
export declare function updateProfile(user: Profile): Promise<Profile>;
export declare function deleteProfile(userId: string): Promise<unknown>;
export declare function getOrders(user_id: string): Promise<OrderList>;
export declare function cardCallBack(callBackUrl: string, token: string): Promise<CardCallBackResponse>;
