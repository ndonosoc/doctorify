const addressInputFakeSelector = document.querySelector("#address")
const addressInputTrueSelector = document.querySelector("#addressValue")


if (addressInputFakeSelector) {
  addressInputTrueSelector.value = addressInputFakeSelector.value;
  addressInputFakeSelector.addEventListener('blur', event => {
    addressInputTrueSelector.value = addressInputFakeSelector.value;
  })
}


