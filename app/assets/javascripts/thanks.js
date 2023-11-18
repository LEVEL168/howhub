// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$("#thank_btn_<%= @craft.id %>").html("<%= j(render 'thank/btn', craft: @craft) %>");