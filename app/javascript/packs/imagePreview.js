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
  const form = $("form");
  $(".multi-hide").on("change", function (e) {
    e.preventDefault();
    const labels = document.getElementsByTagName("label");
    let label;

    for (let i = 0; i < labels.length; i++) {
      if (labels[i].textContent == "Title") {
        label = labels[i];
        break;
      }
    }
    let slug = label.nextElementSibling
    slug = slug.textContent
    slug = slug.toLowerCase().split(" ").join("-");

    const url = $(form).attr("action")
    const method = $(form).attr("method")
    $.ajax({
      url: url,
      type: method,
      dataType: "JSON",
      data: new FormData(form[0]),
      processData: false,
      contentType: false,
      complete: function () {
        if (method.toLowerCase === "post"){
        window.location.href = `/posts/${slug}/edit`
        } else {
          window.location.reload()
        }
      },
    });
  });
}
