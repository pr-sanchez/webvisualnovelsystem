// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



// var Slider = 0;
// carousel();
// function carousel() {
//     var i;
//     var x = document.getElementsByClassName("Slides");
//     for (i = 0; i < x.length; i++) {
//        x[i].style.display = "none";  
//     }
//     Slider++;
//     if (Slider > x.length) {Slider = 1}    
//     x[Slider-1].style.display = "block";  
//     setTimeout(carousel, 5000000);
// }


//Flash message
$(document).ready(function () {
    $(".flash-message").delay(1000).fadeOut(3500); 
})


//Burguer menu button
document.addEventListener('DOMContentLoaded', function () {

    // Get all "navbar-burger" elements
    var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
  
    // Check if there are any navbar burgers
    if ($navbarBurgers.length > 0) {
  
      // Add a click event on each of them
      $navbarBurgers.forEach(function ($el) {
        $el.addEventListener('click', function () {
  
          // Get the target from the "data-target" attribute
          var target = $el.dataset.target;
          var $target = document.getElementById(target);
  
          // Toggle the class on both the "navbar-burger" and the "navbar-menu"
          $el.classList.toggle('is-active');
          $target.classList.toggle('is-active');
  
        });
      });
    }
  
  });

	$(document).ready(function() {
    var offsetSize = $(".button").innerHeight();
    
    $("html, body").animate({scrollTop:$(window.location.hash).offset().top-offsetSize }, 1500);
    
  });
   

