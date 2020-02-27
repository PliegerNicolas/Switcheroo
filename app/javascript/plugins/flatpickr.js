import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

const instrumentpage = document.querySelector('instruments-show')

if (instrumentpage) {
const dates = document.querySelector('.pick-dates-pannel').dataset["target"].split("[]")

flatpickr(".datepicker", {
  minDate: new Date(),
  disable: dates,
})
}
