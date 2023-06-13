import { Controller } from "@hotwired/stimulus"
import Swiper from 'https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.esm.browser.min.js'

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    const swiper = new Swiper(this.element, {
      // Optional parameters
    direction: 'horizontal',
    loop: true,

    // If we need pagination
    pagination: {
      el: '.swiper-pagination',
    },

  });
  }
}
