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
      image_list: [
        {title: 'Cat', value: 'https://via.placeholder.com/150'},
        {title: 'Dog', value: 'https://via.placeholder.com/300'}
      ],
      skin_url: oxide
    });


    // Image upload preview in pages where tinyMce is active currently needed for service and town image preview.

})
