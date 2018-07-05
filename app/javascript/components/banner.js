import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Park it.", "Pin it.", "Clean it."],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
