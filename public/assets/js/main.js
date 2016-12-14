var MetricLocations = {};
var map;

$(document).ready(function () {

  $('form').submit(function(e){
        e.preventDefault();
        var metric_name_val = '';
        var driver_name_val = '';
        if($('#search_type').val() == 'driver_name'){
          driver_name_val = $('#q').val();
        }else{
          metric_name_val = $('#q').val();
        }
        $('.loader-warp').fadeIn();
        $.ajax({
            url: "/task/ajax",
            type: "GET",
            data: {
                "metric_name": metric_name_val,
                "driver_name": driver_name_val,
            },
            done: function () {
            },
            success: function (resultObj) {
              MetricLocations = resultObj;
              initialize();
            }}).done(function( html ) {
                console.log('ssssss');
                 $('.loader-warp').fadeOut();
       });
   });


});


function initialize() {
    // Set static latitude, longitude value
    var latlng = new google.maps.LatLng(1, 1);
    // Set map options
    var myOptions = {
        zoom: 16,
        center: latlng,
        panControl: true,
        zoomControl: true,
        scaleControl: true,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    // Create map object with options
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    $(MetricLocations).each(function(index,dom){
      addMarker(new google.maps.LatLng(dom.lat,dom.lon), map);
    });
}
function addMarker(latLng, map) {
    var marker = new google.maps.Marker({
        position: latLng,
        map: map,
        draggable: true, // enables drag & drop
        animation: google.maps.Animation.DROP
    });

    return marker;
}
