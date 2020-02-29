import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import 'flatpickr/dist/themes/material_blue.css';
import flatpickr from 'flatpickr';
import { initMapbox } from '../plugins/init_mapbox';
import {initAutocomplete} from '../plugins/init_autocomplete';
import {initAutocomplete2} from '../plugins/init_autocomplete';
import { addressInputFakeSelector } from '../plugins/algolia_fix';
import { buttonDisabler } from '../plugins/button_disabler';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

initMapbox();
buttonDisabler();

const datepicker = document.querySelector(".datepicker");
const timepicker = document.querySelector(".timepicker");

if (datepicker) {
  // const unavailableDates = JSON.parse(document.querySelector('#unavailable_dates').dataset.unavailable)
   const weekends = (date) => {
      return (date.getDay() === 0 || date.getDay() === 6);
        }
  flatpickr(".datepicker", {
    inline: true,
    altInput: true,
    enableTime: true,
    minDate: 'today',
    minuteIncrement: 30,
    minTime: "8:00",
    maxTime: "20:00"
    // disable: [weekends]
    });
}

if (timepicker) {
  flatpickr(".timepicker", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
      minTime: "16:00",
      maxTime: "22:00",
      minuteIncrementer: 15
  });
}

initAutocomplete();
initAutocomplete2();

// document.querySelector(".numInput.flatpickr-minute").value
// "00"
// document.querySelector(".numInput.flatpickr-hour").value
// "08"
// document.querySelector(".flatpickr-day.selected").innerText
// document.querySelector("#new_appointment > div > div > div.flatpickr-months > div > div > select").value
// (anonymous) @ VM3364:1
// document.querySelector(".flatpickr-day.selected").innerText
// "28"
// ["February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", "January"]



