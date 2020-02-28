import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('address');
  if (addressInput) {
    places({ container: addressInput });
  }
};const initAutocomplete2 = () => {
  const addressInput = document.getElementById('address2');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
export { initAutocomplete2 };
