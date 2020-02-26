import "bootstrap";
import "../plugins/search";
import 'mapbox-gl/dist/mapbox-gl.css';
import 'flatpickr/dist/flatpickr.min.css'
import flatpickr from 'flatpickr';
import { initMapbox } from '../plugins/init_mapbox';
import {initAutocomplete} from '../plugins/init_autocomplete';

initMapbox();

flatpickr(".datepicker", {
  altInput: true,
  enableTime: true,
    enable: [ "2020-02-01", "2020-02-02", "2020-02-03", "2020-02-05"]
  });

flatpickr(".timepicker", {
  enableTime: true,
  noCalendar: true,
  dateFormat: "H:i",
    minTime: "16:00",
    maxTime: "22:00",
    minuteIncrementer: 15
});

initAutocomplete();
