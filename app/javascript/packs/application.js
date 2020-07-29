// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'bootstrap'
import './src/application.scss'

import fontawesome from './fontawesome'

fontawesome()

import greyscale from './greyscale';
import easing from './easing';

console.log("OUTSIDE DOCUMENT READY")
$(document).on('turbolinks:load', function () {
  console.log("INSIDE DOCUMENT READY")
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

  // Show characters left for meta description. 
  $('#meta-word-text').keyup(function (e) {
    var numWords = $.trim($("#meta-word-text").val()).split("").length;
    $('#meta-word-label').text(`Characters left ${120 - numWords}`)
  })

  // FAQ Collapse
  $(".collapsible-item").click(function (e) {
    $(e.target).siblings().toggle()
    $(this).toggleClass("active")
  })
});


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

