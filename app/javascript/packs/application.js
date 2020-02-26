import "bootstrap";
import "../plugins/search";
import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';
import {initAutocomplete} from '../plugins/init_autocomplete';

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
