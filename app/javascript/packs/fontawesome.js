import { library, dom } from '@fortawesome/fontawesome-svg-core';
import faTwitter from '../../../node_modules/@fortawesome/free-brands-svg-icons/faTwitter'
import faFacebookF from '../../../node_modules/@fortawesome/free-brands-svg-icons/faFacebookF';
import faYoutube from '../../../node_modules/@fortawesome/free-brands-svg-icons/faYoutube';
import faMapMarkedAlt from '../../../node_modules/@fortawesome/free-solid-svg-icons/faMapMarkedAlt';
import faEnvelope from '../../../node_modules/@fortawesome/free-solid-svg-icons/faEnvelope';
import faMobileAlt from '../../../node_modules/@fortawesome/free-solid-svg-icons/faMobileAlt';
import faPaperPlane from '../../../node_modules/@fortawesome/free-regular-svg-icons/faPaperPlane;'

export default function fontawesome(){
  library.add(faTwitter, faFacebookF, faYoutube, faMobileAlt, faMapMarkedAlt, faEnvelope, faPaperPlane)
  dom.watch()
}
