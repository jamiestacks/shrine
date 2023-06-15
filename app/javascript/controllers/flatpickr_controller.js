import { Controller } from "@hotwired/stimulus";
import Flatpickr from "./datepicker_controller";

// Connects to data-controller="flatpickr"
export default class extends Flatpickr {
  static values = {
    date: String,
    dated: String,
  };
  connect() {
    // See if connected
    console.log("flatpickr connected");
    // Target the date of end
    const endDate = document.querySelector("[data-flatpickr-dated-value]");

    //always call super.connect()
    super.connect();

    // Change the value of start date
    this.element.nextElementSibling.setAttribute("value", this.dateValue);
    // Change the value of end date
    endDate.nextElementSibling.setAttribute("value", this.datedValue);
  }
}
