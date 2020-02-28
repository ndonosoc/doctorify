const addressInputFakeSelector = document.querySelector("#address")
const addressInputFakeSelector2 = document.querySelector("#address2")
const addressInputTrueSelector = document.querySelector("#addressValue")
const addressInputTrueSelector2 = document.querySelector("#addressValue2")


if (addressInputFakeSelector) {
  if(addressInputTrueSelector) {
  addressInputTrueSelector.value = addressInputFakeSelector.value;
  addressInputTrueSelector.value = addressInputFakeSelector.value;
  addressInputFakeSelector.addEventListener('blur', event => {
    addressInputTrueSelector.value = addressInputFakeSelector.value;})
}
  if(addressInputTrueSelector2) {
  addressInputTrueSelector2.value = addressInputFakeSelector2.value;
  addressInputTrueSelector2.value = addressInputFakeSelector2.value;
  addressInputFakeSelector2.addEventListener('blur', event => {
    addressInputTrueSelector2.value = addressInputFakeSelector2.value;})
}
}
