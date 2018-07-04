import "bootstrap";
import { btnGooFunc, inputBlur } from "./btnGoo";
import { autocomplete } from "../components/autocomplete";
    console.log("IN APP JS before");
import { loadDynamicBannerText } from '../components/slogan';
    console.log("IN APP JS after");

btnGooFunc();
// inputBlur();
autocomplete();

// Park it.
loadDynamicBannerText();
