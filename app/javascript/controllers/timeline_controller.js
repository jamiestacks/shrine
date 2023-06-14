import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item", "image"];

  connect() {
    this.scrollHandler = this.changeBackground.bind(this);
    window.addEventListener('scroll', this.scrollHandler);
    console.log("wow");
  }

  disconnect() {
    window.removeEventListener('scroll', this.scrollHandler);
  }


}
