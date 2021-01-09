import { imagePreview, contentImagePreview } from "./imagePreview";

document.addEventListener("turbolinks:load", ()=> {
  imagePreview("#town_image", "#service_image");
  contentImagePreview()
});