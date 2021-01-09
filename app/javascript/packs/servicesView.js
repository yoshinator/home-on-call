import imagePreview from './imagePreview';


document.addEventListener("turbolinks:load", ()=> {
  imagePreview("#service_featured_image", "#service_image");
  const form = $("form")
  $(".d-none").on("change", function(e){
    e.preventDefault()
    console.log($(form).attr("action"));
    $.ajax({
      url: $(form).attr("action"),
      type: $(form).attr("method"),
      dataType: "JSON",
      data: new FormData(form[0]),
      processData: false,
      contentType: false,
      complete: function(){
        location.reload()
      }
    });  
  })

});


