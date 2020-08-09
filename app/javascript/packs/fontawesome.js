import { library, dom } from '@fortawesome/fontawesome-svg-core';
import { faTwitter } from '@fortawesome/free-brands-svg-icons/faTwitter';
import { faFacebookF } from '@fortawesome/free-brands-svg-icons/faFacebookF';
import { faYoutube } from '@fortawesome/free-brands-svg-icons/faYoutube';
import { faMapMarkedAlt } from '@fortawesome/free-solid-svg-icons/faMapMarkedAlt';
import { faEnvelope } from '@fortawesome/free-solid-svg-icons/faEnvelope';
import { faMobileAlt } from '@fortawesome/free-solid-svg-icons/faMobileAlt';
import { faPaperPlane } from '@fortawesome/free-regular-svg-icons/faPaperPlane';
import { faBars } from '@fortawesome/free-solid-svg-icons/faBars.js';

export default function fontawesome(){
  library.add(faTwitter, faFacebookF, faYoutube, faMobileAlt, faMapMarkedAlt, faEnvelope, faPaperPlane, faBars)
  dom.watch()
}
