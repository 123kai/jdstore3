// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require bootstrap-sprockets
//= require bootstrap/carousel
//= require_tree .
//= require bootstrap/modal

$(document).ready(function(){
  // Activate carousel
  $("#myCarousel").carousel({interval: 5000});

  // Enable carousel Indicators
  $(".item1").click(function(){
    $("#myCarousel").carousel(0);
  });
  $(".item2").click(function(){
    $("#myCarousel").carousel(1);
  });
  $(".item3").click(function(){
    $("#myCarousel").carousel(2);
  });

  // Enable Carousel Controls
  $(".left").click(function(){
    $("#myCarousel").carousel("prev");
  });
  $(".right").click(function(){
    $("#myCarousel").carousel("next");
  });

});



//-------------- product index --------------
$(".box i").click(function() {

  var productImg = $(this).siblings("img").attr('src');
  var productimgNo = $(this).siblings("img").attr('alt');
  var productName = $(this).siblings("h3").text();
  var productPrice = $(this).siblings("p").text();
  var productQty = 1;
  var total = parseFloat(productPrice);
  var info = $('<div class="row">' + '<img src="' + productImg + '" class="' + productimgNo + '">' + '<h4>' + productName + "</h4>" + '<p>' + productPrice + "</p>" + '<div class="qty-minus">-</div>' + '<div class="qty">' + productQty + '</div>' + '<div class="qty-plus">+</div>' + '<div class="del">Remove</div>' + '<div class="totalprice">' + total + '</div>' + '</div>');

  /*add item*/
  $("#cart").append(info);

  /*if item exist, add quantity*/
  if ($('.pic1').size() > 1) {
    var newQty = parseInt($('.pic1').first().siblings('.qty').text()) + 1;
    $('.pic1').parents('.row').first().remove();
    $('.pic1').siblings('.qty').text(newQty);
    total = newQty*productPrice;
    $('.pic1').siblings('.totalprice').text(total);
  } else if ($('.row .pic2').size() > 1) {
    var newQty = parseInt($('.pic2').first().siblings('.qty').text()) + 1;
    $('.pic2').parents('.row').first().remove();
    $('.pic2').siblings('.qty').text(newQty);
    total = newQty*productPrice;
    $('.pic2').siblings('.totalprice').text(total);
  } else if ($('.pic3').size() > 1) {
    var newQty = parseInt($('.pic3').first().siblings('.qty').text()) + 1;
    $('.pic3').parents('.row').first().remove();
    $('.pic3').siblings('.qty').text(newQty);
    total = newQty*productPrice;
    $('.pic3').siblings('.totalprice').text(total);
  }



  /*delete item*/
  $('.del').click(function() {
    $(this).parents(".row").remove();
  });
});
