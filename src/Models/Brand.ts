import type { Location } from "./Location";
import type { Tile } from "./Tile";

export class Brand {
    identifier!: string;
    name!: string;
    iap_enabled!: string;
    locations!: Location[];
    terms_of_use!: string;
    card_terms_and_conditions!: string;
    tiles!: Tile[];
    faqs!: string;
    profile_text!: string;
    disable_parking_collection!: boolean;
  }
