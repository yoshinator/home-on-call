$(document).on('ready turbolinks:load', ()=>{
  el = $('.placeholder1')

  width = $(window).width();
  mobile_breakpoint = 480;

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
  el2 = $('.root-mast')
  data = el2.data()
  if (width <= mobile_breakpoint) {
    url = data.mobileUrl;
  } else {
    url = data.desktopUrl;
  }
  el2.css("background", `url(${url})`)
})