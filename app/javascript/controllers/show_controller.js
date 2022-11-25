import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show"
export default class extends Controller {

  static targets = ['myRents', 'myInstrumentsRented', 'myInstruments' ]

  connect() {
    console.log("show connected")
  }

  myRents() {
    this.myRentsTarget.classList.remove('d-none')
    this.myInstrumentsRentedTarget.classList.add('d-none')
    this.myInstrumentsTarget.classList.add('d-none')
  }

  myInstrumentsRented() {
    this.myRentsTarget.classList.add('d-none')
    this.myInstrumentsRentedTarget.classList.remove('d-none')
    this.myInstrumentsTarget.classList.add('d-none')
  }

  myInstruments() {
    this.myRentsTarget.classList.add('d-none')
    this.myInstrumentsRentedTarget.classList.add('d-none')
    this.myInstrumentsTarget.classList.remove('d-none')
  }
}
