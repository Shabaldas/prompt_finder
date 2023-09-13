import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["spinner"];

  connect() {
    this.hideSpinner();
  }

  showSpinner() {
    this.spinnerTarget.classList.remove("hidden");
  }

  hideSpinner() {
    this.spinnerTarget.classList.add("hidden");
  }
}
