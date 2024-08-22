import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown-menu"
export default class extends Controller {
  static targets = ['bouton', 'menu']
  connect() {
  }

  menu(event) {
    this.menuTarget.classList.remove('d-none')
    this.boutonTarget.classList.add('d-none')
  }
}
