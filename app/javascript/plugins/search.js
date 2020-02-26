const specializationInput = document.getElementById("specializationInput");
const locationInput = document.getElementById("locationInput");
const findDoctors = document.getElementById("findDoctors");

const createSubmitUrl = () => {
  findDoctors.setAttribute('href', `users?location=${locationInput.value}&specialization=${specializationInput.value}`)
}

if (findDoctors) {
  specializationInput.addEventListener('focus', event => createSubmitUrl())
  specializationInput.addEventListener('blur', event => createSubmitUrl())
  locationInput.addEventListener('focus', event => createSubmitUrl())
  locationInput.addEventListener('blur', event => createSubmitUrl())
}
