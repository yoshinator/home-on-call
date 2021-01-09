
import { imagePreview, contentImagePreview } from "./imagePreview";

document.addEventListener("turbolinks:load", ()=> {
  imagePreview("#post_featured_image", "#post_image")
  contentImagePreview()
});