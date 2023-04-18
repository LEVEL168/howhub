/*global $*/
$(function(){
    $('#open').click(function(){
      $('.overlay').toggleClass('show'); 
      if($('.overlay').hasClass('show')){
          $('.fa-bars').hide();
          $('.fa-times').show();
      }
       
      $('.overlay').toggleClass('is-active');
    });
    
    $('.fa-times').click(function(){
        $('.overlay').toggleClass('hide');
        if($('.overlay').hasClass('hide')){
          $('.fa-times').hide();
          $('.fa-bars').show(); 
        }
        
        $('.overlay').toggleClass('is-active');
    });
});





// $(function(){
//   $('.sp-menu').on('click', function(){
//       $('.overlay').toggleClass('is-active') 
//   });
// });





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