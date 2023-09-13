import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["submitButton", "queryInput", "clearButton"];

  connect() {
    this.submitButtonTarget.classList.add("cursor-not-allowed");
    this.queryInputTarget.addEventListener("input", () => {
      this.toggleButtonState();
    });
  }

  toggleButtonState() {
    const query = this.queryInputTarget.value.trim();
    const button = this.submitButtonTarget;
    const clearButton = this.clearButtonTarget;

    if (query !== "") {
      button.className = '';
      button.classList.add("my-button");
      clearButton.classList.remove("hidden");
    } else {
      
      console.log(this.clearButtonTarget);
      button.classList.remove("my-button");
      clearButton.classList.add("hidden");
      button.classList.add("disabled");
      button.classList.add("cursor-not-allowed");
    }
  }

  clearSearch() {
    console.log('CLEAR')
    this.queryInputTarget.value = "";
    this.toggleButtonState();
  }
}
