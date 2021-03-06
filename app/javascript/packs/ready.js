import greyscale from './greyscale';
import easing from './easing';
import screenSize from './screenSize';
import fontawesome from './fontawesome'

fontawesome()
$(document).on('turbolinks:load', function () {
  screenSize()
  greyscale();
  easing();

  // Multi Step Lead Form.

  $("#next-1").click(function (e) {
    e.preventDefault();
    $("#second").show();
    $("#first").hide();
    $("#progressBar").css("width", "40%");
    $("#progressText").text("Step - 2");
  });

  $("#next-2").click(function (e) {
    e.preventDefault();
    $("#third").show();
    $("#second").hide();
    $("#progressBar").css("width", "60%");
    $("#progressText").text("Step - 3");
  });

  $("#next-3").click(function (e) {
    e.preventDefault();
    $("#fourth").show();
    $("#third").hide();
    $("#progressBar").css("width", "80%");
    $("#progressText").text("Step - 4");
  });

  $("#next-4").click(function (e) {
    e.preventDefault();
    $("#fifth").show();
    $("#fourth").hide();
    $("#progressBar").css("width", "100%");
    $("#progressText").text("Step - 5");
  });

  $("#prev-2").click(function (e) {
    e.preventDefault();
    $("#second").hide();
    $("#first").show();
    $("#progressBar").css("width", "20%");
    $("#progressText").text("Step - 1");
  })

  $("#prev-3").click(function (e) {
    e.preventDefault();
    $("#third").hide();
    $("#second").show();
    $("#progressBar").css("width", "40%");
    $("#progressText").text("Step - 2");
  })

  $("#prev-4").click(function (e) {
    e.preventDefault();
    $("#fourth").hide();
    $("#third").show();
    $("#progressBar").css("width", "60%");
    $("#progressText").text("Step - 3");
  });

  $("#prev-5").click(function (e) {
    e.preventDefault();
    $("#fifth").hide();
    $("#fourth").show();
    $("#progressBar").css("width", "80%");
    $("#progressText").text("Step - 4");
  });

  // Modal toggle
  $('#myModal').modal();

  // Show characters left for town meta description. 
  $('#meta-word-text').keyup(function(e){
    var numWords = $.trim($("#meta-word-text").val()).split("").length;
    $('#meta-word-label').text(`Characters left ${120-numWords}`)
  })

  // Show characters left for meta description. 
  $('#meta-main-word-text').keyup(function (e) {
    var numWords = $.trim($("#meta-main-word-text").val()).split("").length;
    $('#meta-main-word-label').text(`Characters left ${120 - numWords}`)
  })

  // FAQ Collapse
  $(".collapsible-item").click(function(e){
    $(e.target).siblings().toggle()
    $(this).toggleClass("active")
  })

  //Homepage search

  $(document).on("click", function (e) {
    if ($(e.target).closest(".dopecomplete.service-search").length > 0 ){
    location.href = `${$(location).attr("href")}search_results?search=${
      e.target.innerText
    }`;
    }   
    else if ($(e.target).closest(".dopecomplete.zip-search").length > 0 ){
    location.href = `${e.target.dataset.travel}`;
    }
    else if (
      $(e.target).closest("#search_light_input").length === 1 ||
      ($(e.target).closest("#zip_search").length &&
      $(".dopecomplete").is(":hidden"))
    ) {
      $(".dopecomplete").show();
    } else if ($("#search_light_input").is(":focus")) {
      $(".dopecomplete").show();
    } else {
      $(".dopecomplete").hide();
    }
  });

  $(document).on("scroll", function(e){
    $(".dopecomplete").hide();
  })
  $("#search_light_input").on("focusin", function(e){
    $(".dopecomplete").show();
  })

  $("#search_light_input").on("keyup",delay(function(e) {
    fetch(`${location.href}json_search?search=${e.target.value}`)
    .then(response => response.json())
    .then(data => {
      let lis = '<li aria-selected="false" class="title">Popular Services</li>'
       lis += data.map(item => {
        return `<li aria-select="false">${item.title}<li>`
      }).join("")
      $(".dopecomplete ul").html(lis)
      $(".dopecomplete").show()
    })
  },400));

  $("#zip_search").on("keyup",delay(function(e){
    var url = $(location).attr("href").replace(/\/+$/, ""), //rtrim `/`
      url_parts = url.split("/"),
      url_last = url_parts[url_parts.length - 1];
    fetch(`/zip_search?search=${e.target.value}&service=${url_last}`)
      .then((resp) => resp.json())
      .then((zips) => {
        console.log(zips)
        let lis = '<li aria-selected="false" class="title">Cities</li>'
        lis += zips.map(zip => {
        return `<li aria-select="false" data-travel="${location.origin}/m/${zip.market}/${zip.service}">${zip.zip}, ${zip.town.name} | ${zip.town.county}, ${zip.town.state}<li>`
      }).join("")
      $(".dopecomplete ul").html(lis)
      $(".dopecomplete").show()
    })
  },500))

  function delay(callback, ms) {
    var timer = 0;
    return function () {
      var context = this,
        args = arguments;
      clearTimeout(timer);
      timer = setTimeout(function () {
        callback.apply(context, args);
      }, ms || 0);
    };
  }

});
