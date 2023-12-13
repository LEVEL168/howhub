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
//= require_tree .

console.log('hoge')


/*global $*/
$(function () {
  $('#open').click(function () {
    $('.overlay').toggleClass('show');
    $('.fa-bars').hide();
    $('.overlay').toggleClass('is-active');
  });

  $('.fa-times').click(function () {
    $('.overlay').toggleClass('show');
    $('.fa-bars').show();
    $('.overlay').toggleClass('is-active');
  });
});


$(function() {
    $('.card-list').jscroll(
    )
    var jscrollOption = {
        loadingHtml: '読み込み中・・・', //記事読み込み中の表示
        autoTrigger: true, // 自動で読み込むか否か、trueで自動、falseでボタンクリックとなる
        nextSelector: 'a.pagination-next', // 次に読み込むコンテンツのURLのあるa要素を指定。
        padding: 20, // 指定したコンテンツの下かた何pxで読み込むかを指定(autoTrigger: trueの場合のみ)
        contentSelector: '.card' // 読み込む範囲の指定
    };
    $('.card-list').jscroll(jscrollOption);
});

