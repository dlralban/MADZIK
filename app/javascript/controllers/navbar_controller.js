import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {

  updateNavbar() {
    if (window.scrollY >= (window.innerHeight/2)) {
      this.element.classList.add("navbar-transparent")
    } else {
      this.element.classList.remove("navbar-transparent")
    }
  }
}
