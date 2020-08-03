$(document).on('ready turbolinks:load', ()=>{
el = $('.placeholder1')

el.get().forEach(img => {
  width = $(window).width();
  mobile_breakpoint = 480;
  
  if (width <= mobile_breakpoint) {
    url = img.dataset.mobileUrl;
  } else {
    url = img.dataset.desktopUrl;
  }
  img.src =  url
})

})