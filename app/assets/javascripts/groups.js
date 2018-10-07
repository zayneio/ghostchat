$(document).ready(function() {
  // submitNewMessage();
  $('textarea#message_body').keydown(function(event) {
    debugger
    if (event.keyCode == 13) {
        $('input[type=submit]').submit();
        $('#message_body').val("")
        return false;
     }
  });  
});

// function submitNewMessage(){
//   $('textarea#message_body').keydown(function(event) {
//     debugger
//     if (event.keyCode == 13) {
//         $('input[type=submit]').submit();
//         $('#message_body').val("")
//         return false;
//      }
//   });
// }
