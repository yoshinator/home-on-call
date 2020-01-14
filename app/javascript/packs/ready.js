import greyscale from './greyscale'
import easing from './easing'
$(document).on('ready turbolinks:load', function () {

  easing()
  greyscale()
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

  // next two functions are to dynamically add or remove blocks for services
  $('form').on('click', '.remove_record', function (event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('tr').hide();
    return event.preventDefault();
  });

  $('form').on('click', '.add_fields', function (event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.fields').append($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });

  // Modal toggle
  $('#myModal').modal()

});
