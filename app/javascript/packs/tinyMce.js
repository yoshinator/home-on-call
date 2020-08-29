import tinymce from 'tinymce/tinymce';
import 'tinymce/skins/content/default/content.min.css';
import 'tinymce/themes/silver/theme';
import 'tinymce/icons/default/icons';
import 'tinymce/plugins/table';
import 'tinymce/plugins/lists';
import 'tinymce/plugins/paste';
import 'tinymce/plugins/link';
import 'tinymce/plugins/autosave';
import 'tinymce/plugins/code';
import 'tinymce/plugins/wordcount';
import 'tinymce/plugins/image';
import 'tinymce/plugins/imagetools';
import oxide from './src/skins/ui/oxide-dark/skin.min.css';

document.addEventListener("turbolinks:load", ()=> {

    const newLocal = '/styles/content.min.css';
    tinymce.init({
      selector: '.tiny',
      skin: false,
      // some other settings, like height, language,         
      // order of buttons on your toolbar etc.
      height: 400,
      images_upload_url: '/images/uploader',
      automatic_uploads: true,
      file_picker_types: 'file image media',
      content_css: newLocal, // <-- this is in the public folder
      plugins: ['table', 'lists', 'paste', 'link', 'autosave', 'code', 'wordcount', 'image', 'imagetools'],
      skin_url: oxide
    });


    // Image upload preview in pages where tinyMce is active
    (function(){
      var reader =  new FileReader();
      var field1 = document.querySelector('#service_featured_image')
      var field2 = document.querySelector('#service_image')
      var preview

      if (field1 || field2){
        reader.onload = function(e){
          preview.style.backgroundImage  = `url(${e.srcElement.result})`
        }

        field1.addEventListener("input", function(e){
          preview = document.querySelector("#featured-preview")
          reader.readAsDataURL(e.currentTarget.files[0])
        },false)

        field2.addEventListener("input", function (e) {
          preview = document.querySelector("#image-preview")
          reader.readAsDataURL(e.currentTarget.files[0])
        }, false)
      }

    })()

})

