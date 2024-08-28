import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submit-on-click"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("AutoSubmitController connected")
  }

  submitForm(event) {
    this.formTarget.submit()
  }
}
