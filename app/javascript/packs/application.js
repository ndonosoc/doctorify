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
    minDate: 'today',
    minuteIncrementer: "30",
    "disable": [
        function(date) {
            return (date.getDay() === 0 || date.getDay() === 6);
        }
    ],
    });
}

const toggleDateInputs = () => {
  const dateInput = document.getElementById('appointment_date');

  if (dateInput) {
    const unvailableDates = JSON.parse(document.querySelector('.widget-content').dataset.unavailable)

    flatpickr(startDateInput, {
    minDate: 'today',
    dateFormat: 'd-m-Y',
    disable: unvailableDates,
    onChange: function(selectedDate) {
      if (selectedDate === '') {
        dateInput.disabled = true;
      }
      let minDate = selectedDates[0];
      minDate.setDate(minDate.getDate() + 1);
      endDateCalendar.set('minDate', minDate);
      endDateInput.disabled = false;
    }
  });
    const endDateCalendar =
      flatpickr(endDateInput, {
        dateFormat: 'd-m-Y',
        disable: unvailableDates,
        },
      );
  }
};

export { toggleDateInputs }

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
