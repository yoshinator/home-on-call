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

    let imageCollection = document.querySelectorAll(".content-images");
    imageCollection = Array.from(imageCollection);
    const images = [];
    imageCollection.map( tag=> {
      images.push({title: tag.dataset.name, value: tag.dataset.image})
    })
    tinymce.init({
      selector: '.tiny',
      skin: false,
      // some other settings, like height, language,         
      // order of buttons on your toolbar etc.
      height: 400,
      automatic_uploads: false,
      file_picker_types: 'file image media',
      content_css: newLocal, // <-- this is in the public folder
      plugins: ['table', 'lists', 'paste', 'link', 'autosave', 'code', 'wordcount', 'image', 'imagetools'],
      image_list: images,
      skin_url: oxide
    });

})
