import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    this.modal = new window.bootstrap.Modal(this.modalTarget)
  }

  showModal(event) {
    this.modal.show()
  }
}
