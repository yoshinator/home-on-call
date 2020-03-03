import tinymce from 'tinymce/tinymce';
import 'tinymce/themes/silver/theme';
import 'tinymce/plugins/table';
import 'tinymce/plugins/lists';
import 'tinymce/plugins/paste';
import 'tinymce/plugins/link';
import 'tinymce/plugins/autosave';
import 'tinymce/plugins/code';
import 'tinymce/plugins/wordcount';
import oxide from '../src/skins/ui/oxide-dark/skin.min.css';

function tinyMce() {
  console.log("Initializing tinyMce")
  tinymce.init({
    selector: '#tiny',
    // some other settings, like height, language,         
    // order of buttons on your toolbar etc.
    height: 400,
    plugins: ['table', 'lists', 'paste', 'link', 'autosave', 'code','wordcount'],
    skin_url: oxide
  });
}

export default tinyMce
