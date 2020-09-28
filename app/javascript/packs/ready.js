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


  $("#search_light_input").focusin(function(e){
    $(".dopecomplete").toggle();
  })
  $("#search_light_input").focusout(function (e) {
    $(".dopecomplete").toggle();
    });
});
