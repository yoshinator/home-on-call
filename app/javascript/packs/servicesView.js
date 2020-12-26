import imagePreview from './imagePreview';

document.addEventListener("turbolinks:load", ()=> {
  imagePreview("#service_featured_image", "#service_image");
});
