import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

const dates = document.querySelector('.pick-dates-pannel').dataset["target"].split("[]")


console.log(dates)

flatpickr(".datepicker", {
  minDate: new Date(),
  disable: dates,
})

