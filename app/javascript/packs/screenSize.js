export default function screenSize (){
  let body = document.querySelector(".pages.home")
  if(body){
    let el = $('.placeholder1')
    let width = $(window).width();
    let mobile_breakpoint = 480;

    //homepage images
    el.get().forEach(img => {
      if (width <= mobile_breakpoint) {
        var url = img.dataset.mobileUrl;
      } else {
        var url = img.dataset.desktopUrl;
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