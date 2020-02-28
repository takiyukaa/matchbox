import "bootstrap";

import { initSweetalert } from '../plugins/init_sweetalert';


initSweetalert('#cancel-booking', {
  title: "Cancel Booking",
  text: "Are you sure?",
  icon: "warning"
}, (value) => {
  if (value) {
    var cancelButton = document.querySelector('#cancel-booking-confirmed');
    cancelButton.click();
}});
