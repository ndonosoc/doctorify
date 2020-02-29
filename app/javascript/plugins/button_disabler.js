const button = document.getElementById("appointmentCreator");

const buttonDisabler = () => {

if (button) {

window.onload = () => {
  button.disabled = true;
};

document.addEventListener("click", event => {
  const date = document.querySelector(".flatpickr-day.selected").attributes['aria-label'].value
  const hours = document.querySelector(".numInput.flatpickr-hour").value
  const minutes = document.querySelector(".numInput.flatpickr-minute").value
  const pm = document.querySelector(".flatpickr-am-pm").innerText
  const datePicked = Date.parse(`${date} ${hours}:${minutes} ${pm}`);

  if (datePicked < Date.now()) {
    button.disabled = true;
  }
  else {
    button.disabled = false;
  }
});
document.addEventListener("keyup", event => {
  const date = document.querySelector(".flatpickr-day.selected").attributes['aria-label'].value
  const hours = document.querySelector(".numInput.flatpickr-hour").value
  const minutes = document.querySelector(".numInput.flatpickr-minute").value
  const pm = document.querySelector(".flatpickr-am-pm").innerText
  const datePicked = Date.parse(`${date} ${hours}:${minutes} ${pm}`);

  if (datePicked < Date.now()) {
    button.disabled = true;
  } else {
    button.disabled = false;
  }
});
};

}

export { buttonDisabler };
