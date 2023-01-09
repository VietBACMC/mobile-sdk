import type { Form_Schema_Item } from "./Form_Schema_Item";

export class Promotion {
    id!: number;
    name!: string;
    title!: string;
    summary!: string;
    tile_image!: string;
    active!: boolean;
    open!: boolean;
    start_date!: string;
    end_date!: string;
    trackable!: boolean;
    confirmable!: boolean;
    external!: boolean;
    country!: string;
    form_schema!: Form_Schema_Item[];
    competition = false;
    desktop_banner!: string;
    mobile_banner!: string;
    banner_background!: string;
    form_header_image!: string;
    products!: string[];
    fulfilment_types!: string[];
    disclaimer!: string;
    terms_and_conditions!: string;
    privacy_policy!: string;
    faqs!: string;
    support_email!: string;
    support_phone!: string;
    contact_us_content!: string;
    extra_claim_cta!: boolean;
    custom_tabs!: string[];
    has_preparation_checks!: boolean;
    preparation_check_content!: string;
    preparation_checks!: string[];
    has_support_categories!: boolean;
    support_categories!: string[];

 
  }