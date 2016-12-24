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
//= require tether
//= require jquery_ujs
//= require turbolinks
//= require_tree .


// $(document).ready(function(){

//   $("#search_title").submit(function(event){

//   // Search For events Using Full Text Search
//   $eventSearch.on('submit', function(e){
//     e.preventDefault();
//     sendAjaxRequest("/title_search", $(this).serialize(), "search_title");
//   });

//   function sendAjaxRequest(url, data, action){
//     if (action == SCHOOL_TYPE) {
//       $schoolResult.empty();
//     }else{
//       $eventResult.empty();
//     }
//     $resultCover.removeClass('hide');

//     $.ajax({
//       url: url,
//       type: 'GET',
//       dataType: 'html',
//       cache: false,
//       data: data,
//       success: function(data){
//         updateView(data, action);
//       },
//       error: function(err){
//         console.log("Error");
//         console.log(err);
//       }
//     });
//   } //AjaxFunction

// });


function deleteRow(r) {
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(i);
}

