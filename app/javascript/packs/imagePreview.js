// Image preview for services, towns and blog
export default function imagePreview(featuredImageId, imageId) {
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
