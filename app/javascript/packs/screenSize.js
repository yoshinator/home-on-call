$(document).on('ready turbolinks:load', ()=>{
  el = $('.placeholder1')
  console.log(el)
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
  console.log(el2, data)
  el2.css("background", `url(${url})`)
})