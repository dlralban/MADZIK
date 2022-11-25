import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show"
export default class extends Controller {

  static targets = ['myRents', 'myInstrumentsRented', 'myInstruments', 'btnMyRents', 'btnmyInstrumentsRented', 'btnMyInstruments' ]

  connect() {
    console.log("show connected")
  }

  myRents() {
    this.btnMyRentsTarget.classList.add('active')
    this.btnmyInstrumentsRentedTarget.classList.remove('active')
    this.btnMyInstrumentsTarget.classList.remove('active')
    this.myRentsTarget.classList.remove('d-none')
    this.myInstrumentsRentedTarget.classList.add('d-none')
    this.myInstrumentsTarget.classList.add('d-none')
  }

  myInstrumentsRented() {
    this.btnmyInstrumentsRentedTarget.classList.add('active')
    this.btnMyRentsTarget.classList.remove('active')
    this.btnMyInstrumentsTarget.classList.remove('active')
    this.myRentsTarget.classList.add('d-none')
    this.myInstrumentsRentedTarget.classList.remove('d-none')
    this.myInstrumentsTarget.classList.add('d-none')
  }

  myInstruments() {
    this.btnMyInstrumentsTarget.classList.add('active')
    this.btnMyRentsTarget.classList.remove('active')
    this.btnmyInstrumentsRentedTarget.classList.remove('active')
    this.myRentsTarget.classList.add('d-none')
    this.myInstrumentsRentedTarget.classList.add('d-none')
    this.myInstrumentsTarget.classList.remove('d-none')
  }
}
