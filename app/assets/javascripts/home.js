/*global $*/
$(function(){
    $('#open').click(function(){
       $('.overlay, nav').toggleClass('show'); 
       if($('.overlay').hasClass('show')){
           $('.fa-bars').hide();
           $('.fa-times').show();
       }else{
           $('.fa-times').hide();
           $('.fa-bars').show();
       }
       
       $('.overlay').toggleClass('is-active');
    });
});

//   $('.nav-btn').on('click', function(){
//     $('.overlay').toggleClass('is-active');
//   });

// $('#open').on('click', function() {
//         $('.overlay, nav').toggleClass('show');
//         // $('.fa-xmark').toggleClass('show');
//     });
    
//     $('#close').on('click', function() {
//         $('.sp-nav').toggleClass('hide');
//     });

// 'use strict';

// {
//     const open = document.getElementById('open');
//     const overlay = document.querySelector('.overlay');
//     const close = document.getElementById('close');
    
//     open.addEventListener('click', () => {
//       overlay.classList.add('show'); 
//       open.classList.add('hide');
//     });
    
//     close.addEventListener('click', () => {
//       overlay.classList.remove('show'); 
//       open.classList.remove('hide');
//     });
    
// }