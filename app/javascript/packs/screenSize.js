export default function screenSize (){
  let body = document.querySelector(".pages.home")
  if(body){
    let el = document.getElementsByClassName('placeholder1')
    let width = window.innerWidth
    let mobile_breakpoint = 480;
    el = Array.from(el)
    //homepage images
    el.forEach(img => {
      if (width <= mobile_breakpoint) {
        var url = img.dataset.mobileUrl;
      } else {
        var url = img.dataset.desktopUrl;
      }
      img.src =  url
    })

    // mast head on homepage only
    let el2 = document.querySelector('.root-mast')
    if (width <= mobile_breakpoint) {
      var url = el2.dataset.mobileUrl;
    } else {
      var url = el2.dataset.desktopUrl;
    }
    el2.style.background =`url(${url})`
  }
}