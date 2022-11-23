import { Controller } from "@hotwired/stimulus"
// Import flatpickr function
import flatpickr from "flatpickr"
// The range plugin is also needed in order to use two inputs
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";
export default class extends Controller {
  // retrieve the targets from the DOM
  static targets = ['startDateInput', 'endDateInput', 'totalPrice', 'price']
  // On controller's connection, call the flatpickr
  // function in order to build the calendars
  connect() {
    flatpickr(this.startDateInputTarget, {
      mode: 'range',
      "plugins": [new rangePlugin({ input: this.endDateInputTarget })]
    })
    console.log(this.priceTarget.getAttribute('value'))
  }

  start() {
    const startDate = new Date(this.startDateInputTarget.value)
    const endDate = new Date(this.endDateInputTarget.value)
    const totalPrice = ((endDate - startDate) / (1000 * 60 * 60 * 24) * this.priceTarget.getAttribute('value')).toFixed(2)
    this.totalPriceTarget.innerText = `total price: ${totalPrice.toString()}€`
    console.log(totalPrice)
  }
}
