export default function screenSize (){
  let el = $('.placeholder1')
  if (el){
    let width = $(window).width();
    let mobile_breakpoint = 480;

    //homepage images
    el.get().forEach(img => {
      if (width <= mobile_breakpoint) {
        url = img.dataset.mobileUrl;
      } else {
        url = img.dataset.desktopUrl;
      }
      img.src =  url
    })

    // mast head on homepage only
    let el2 = $('.root-mast')
    let data = el2.data()
    if (width <= mobile_breakpoint) {
      var url = data.mobileUrl;
    } else {
      var url = data.desktopUrl;
    }
    console.log(el2, data)
    el2.css("background", `url(${url})`)
  }
}