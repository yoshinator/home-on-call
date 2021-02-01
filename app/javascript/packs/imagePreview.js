// Image preview for services, towns and blog
export function imagePreview(featuredImageId, imageId) {
  var reader = new FileReader();
  var field1 = document.querySelector(featuredImageId);
  var field2 = document.querySelector(imageId);
  var preview;

  if (field1 || field2) {
    reader.onload = function (e) {
      preview.style.backgroundImage = `url(${e.srcElement.result})`;
    };

    field1.addEventListener(
      "input",
      function (e) {
        preview = document.querySelector("#featured-preview");
        reader.readAsDataURL(e.currentTarget.files[0]);
      },
      false
    );

    field2.addEventListener(
      "input",
      function (e) {
        preview = document.querySelector("#image-preview");
        reader.readAsDataURL(e.currentTarget.files[0]);
      },
      false
    );
  }
}

export function contentImagePreview(){
  $(".multi-hide").on("change", function (e) {
    console.log("IN CHANGE HANDLER");
    const labels = document.getElementsByTagName("label");
    let label;

    for (let i = 0; i < labels.length; i++) {
      if (labels[i].textContent == "Title") {
        label = labels[i];
        break;
      }
    }
    let slug = label.nextElementSibling.value
    let punc = /[^A-Za-z0-9 _]/g; // replaces all non alphanumeric characters except _ and space
    slug = slug.replace(punc, "")
    slug = slug.toLowerCase().split(" ").join("-")
    
    updatePage(slug)

  });
}

function updatePage(slug){
    let form = $("form");
    const url = $(form).attr("action");
    const method = $(form).attr("method");
    let businessType = $("#service_business_type_id").val();
    
    if (url === "/services" && !businessType) {
      console.log("IN IF");
      alert("Please add a business type first at the bottom of the page and try again.")
    }
    else if (!!slug.length) {
      console.log("IN ELSE IF");
      $.ajax({
        url: url,
        type: method,
        dataType: "JSON",
        data: new FormData(form[0]),
        processData: false,
        contentType: false,
        complete: function () {
          if (method.toLowerCase() === "post") {
            window.location.href = `${url}/${slug}/edit`;
          } else {
            window.location.reload();
          }
        },
      });
    } else {
        console.log("IN ELSE");
        alert("Must have a title!!");
    }
    debugger
}
