function ajaxHandler(e) {
    e.preventDefault()
    var post_url = $(this).attr("action"); //get form action url
    var form_data = $(this).serialize(); //Encode form elements for submission
   
    $.post( post_url, form_data, function(response){
      $.notify({
        message: response.message,
        offset: {from: 'top', amount: 60},
        type: 'success',
        allow_dismiss: true,
        delay: 1000
      });
      $(".course-count").text("done")
    });
   }
   
   var ajaxCart = {
    init: function() {
      $(function(){
        $(".course-form").on('submit', ajaxHandler)
      })
    }
   }
   
   
   export default ajaxCart