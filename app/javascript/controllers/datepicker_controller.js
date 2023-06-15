import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = {
    date: String,
    dated: String,
  };

  connect() {
    // console.log("datepicker connected");
    flatpickr(this.element);

    const startDate = document.querySelector("[data-datepicker-date-value]");
    const endDate = document.querySelector("[data-datepicker-dated-value]");

    // console.log(this.dateValue);

    // console.log(this.dateValue);
    startDate.nextElementSibling.setAttribute("value", this.dateValue);
    endDate.nextElementSibling.setAttribute("value", this.datedValue);
  }
}
