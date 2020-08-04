import tinymce from 'tinymce/tinymce';
import 'tinymce/skins/content/default/content.css';
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
import oxide from './src/skins/ui/oxide-dark/skin.min.css';

export default function tinyMce(){
  const newLocal = '/styles/content.min.css';
  tinymce.init({
    selector: '.tiny',
    skin: false,
    // some other settings, like height, language,         
    // order of buttons on your toolbar etc.
    height: 400,
    content_css: newLocal, // <-- this is in the public folder
    plugins: ['table', 'lists', 'paste', 'link', 'autosave', 'code', 'wordcount'],
    skin_url: oxide
  });
}
