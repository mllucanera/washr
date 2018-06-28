import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  const swalButton = document.getElementById('sweet-alert-demo');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: "A nice alert",
        text: "This is a great alert, isn't it?",
        icon: "success"

      }, function( => {
        window.location.href = "views/booking/new.html";
        showCancelButton: true
      });
      console.log("Reached")
      // warnBeforeRedirect('views/booking/new.html')
    });
    }
  }

// function warnBeforeRedirect(new_booking_path) {
//     swal({
//       title: "Leave this site?",
//       text: "If you click 'OK', you will be redirected to " + new_booking_path,
//       type: "warning",
//     }, function() {
//       // Redirect the user
//       window.location.href = new_booking_path;
//       showCancelButton: true
//     });
//   }



export { bindSweetAlertButtonDemo };
