export default function screenSize (){
  let home = document.querySelector(".pages.home")
  let show = document.querySelector(".pages.show")
  let service = document.querySelector(".pages.service")
  let mktsvc = document.querySelector(".pages.market_service")

  let width = window.innerWidth
  let mobile_breakpoint = 480;
  if(home){
    setImageSource(width)
    setImageMast('.root-mast', width, mobile_breakpoint)
  }
  if(show || service || mktsvc){
    setImageSource(width)
    setImageMast('.all-masts', width, mobile_breakpoint)
  }
}

function setImageSource(width, mobile_breakpoint){
  let el = document.getElementsByClassName('placeholder1')
  el = Array.from(el)
  //homepage images
  el.forEach(img => {
    if (width <= mobile_breakpoint) {
      var url = img.dataset.mobileUrl;
    } else {
      var url = img.dataset.desktopUrl;
    }
    img.src = url
  })
}

function setImageMast(klassName, width, mobile_breakpoint){
  let el2 = document.querySelector(klassName)
  if (width <= mobile_breakpoint) {
    var url = el2.dataset.mobileUrl;
  } else {
    var url = el2.dataset.desktopUrl;
  }
  el2.style.background = `url(${url})`
}