import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import 'flatpickr/dist/themes/material_blue.css';
import flatpickr from 'flatpickr';
import { initMapbox } from '../plugins/init_mapbox';
import {initAutocomplete} from '../plugins/init_autocomplete';

initMapbox();

const datepicker = document.querySelector(".datepicker");
const timepicker = document.querySelector(".timepicker");

if (datepicker) {
  flatpickr(".datepicker", {
    inline: true,
    altInput: true,
    enableTime: true,
      enable: [ "2020-02-01", "2020-02-02", "2020-02-03", "2020-02-05"]
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
