var pos =null;
var arrDok=[], arrBh=[];
var dok=true, bh=true;

urlHost = urlHost.replace("app_dev.php/", "");

$(document).ready(function() {
    google.maps.event.addDomListener(window, 'load', initialize);

    $('#customer_service').change(function(){
        if (dok === false){
            for(k in arrDok) {
                arrDok[k][0].setVisible(true);
            }
            dok = true;
        }
        else {
            for(k in arrDok) {
                arrDok[k][0].setVisible(false);
            }
            dok = false;
        }
    });
    
    $('#salse_office').change(function(){
        if (bh === false){
            for(k in arrBh) {
                arrBh[k][0].setVisible(true);
            }
            bh = true;
        }
        else {
            for(k in arrBh) {
                arrBh[k][0].setVisible(false);
            }
            bh = false;
        }
    });
    
    $('#city').focus(function() {
        dok = false; bh = false;
        for(k in arrBh) {
            arrBh[k][0].setVisible(false);
        }
        for(k in arrDok) {
            arrDok[k][0].setVisible(false);
        }
        
        $('#salse_office').attr('checked',false);
        $('#customer_service').attr('checked',false);
    });
    
    $('.reset-button').click(function() {
        dok = true; bh = true;
        for(k in arrBh) {
            arrBh[k][0].setVisible(true);
        }
        for(k in arrDok) {
            arrDok[k][0].setVisible(true);
        }
        
        $('#city').val("");
        $('.part.two').html("");
        $('#salse_office').prop('checked', true);
        $('#customer_service').prop('checked', true);
    });
    
    $('#formMap').submit(function(ev){
        ev.preventDefault();
        var search = new RegExp(''+$('#city').val()+'','i');
        var found = false;
        
        // hide all markers
        for(k in arrBh) {
            arrBh[k][0].setVisible(false);
        }
        for(k in arrDok) {
            arrDok[k][0].setVisible(false);
        }

        // SEARCHING by NAME or POSTAL CODE
        for (k in locations_dok) {            
            if (search.test(locations_dok[k][3]) || search.test(locations_dok[k][4])) {
                arrDok[k][0].setVisible(true);
                found = true;
            }
        }
        
        for (k in locations_bh) {
            if (search.test(locations_bh[k][3]) || search.test(locations_bh[k][4])) {
                arrBh[k][0].setVisible(true);
                found = true;
            }
        }
        
        // SEARCHING by Distance
        if (found === false) {
			
            var searchLocation = $('#city').val();
            // console.log(searchLocation);
            
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'address': searchLocation }, function (results, status) {
				
            if (status == google.maps.GeocoderStatus.OK) {
                var s = parseLocation(results[0].geometry.location);

                var lat2 = s[0];
                var lng2 = s[1];
                
                var minDistDok = 0;
                var minDistDokMarker = 0;
                
                var minDistBh = 0;
                var minDistBhMarker = 0;
                    
                for (k in locations_dok) {                    
                    var lat1 = locations_dok[k][9];
                    var lng1 = locations_dok[k][8];
                    
                    var dist = distance(lat1, lng1, lat2, lng2);
                    locations_dok[k]['dist'] = dist;
                    
                    if (minDistDok == 0) {
                        minDistDok = dist;
                        minDistDokMarker = k;
                    }
                    
                    // console.log(locations_dok[k][3] + ': ' + distance(lat1, lng1, lat2, lng2));                    
                }
                
                for (k in locations_dok) { 
                    if (locations_dok[k]['dist'] < minDistDok) {
                        minDistDok = locations_dok[k]['dist'];
                        minDistDokMarker = k;
                    }
                }
                
                for (k in locations_bh) {                    
                    var lat1 = locations_bh[k][9];
                    var lng1 = locations_bh[k][8];
                    
                    var dist = distance(lat1, lng1, lat2, lng2);

                    locations_bh[k]['dist'] = dist;
                    
                    if (minDistBh == 0) {
                        minDistBh = dist;
                        minDistBhMarker = k;
                    }
                    
                    // console.log(locations_bh[k][3] + ': ' + distance(lat1, lng1, lat2, lng2));                    
                }
                
                for (k in locations_bh) { 
                    if (locations_bh[k]['dist'] < minDistBh) {
                        minDistBh = locations_bh[k]['dist'];
                        minDistBhMarker = k;
                    }
                }
                
                var resultContent = '';
                
                if (minDistDok < minDistBh) {    
                    arrDok[minDistDokMarker][0].setVisible(true);
                    
                    resultContent = '<p><b>'+locations_dok[minDistDokMarker][10]+'</b><BR><BR>\n\
                        '+locations_dok[minDistDokMarker][5]+'<BR>\n\
                        '+locations_dok[minDistDokMarker][4]+' '+locations_dok[minDistDokMarker][3]+ '<BR><BR>\n\
                        Tel: '+locations_dok[minDistDokMarker][6]+ '<BR>\n';
						if(locations_dok[minDistDokMarker][7] != "")
							resultContent += 'Faksas: '+locations_dok[minDistDokMarker][7]+ '<BR>\n';
						resultContent += 'Darbo laikas: I-V 8 - 17 val.\n';
                     resultContent += '</div>';
                } else {
                    arrBh[minDistBhMarker][0].setVisible(true);
                    
                    resultContent = '<p><b>'+locations_bh[minDistBhMarker][10]+'</b><BR><BR>\n\
                        '+locations_bh[minDistBhMarker][5]+'<BR>\n\
                        '+locations_bh[minDistBhMarker][4]+' '+locations_bh[minDistBhMarker][3]+ '<BR><BR>\n\
                        Tel: '+locations_bh[minDistBhMarker][6]+ '<BR>\n';
						if(locations_dok[minDistDokMarker][7] != "")
							resultContent += 'Faksas: '+locations_dok[minDistDokMarker][7]+ '<BR>\n'; 
						resultContent += 'Darbo laikas: I-V 8 - 17 val.\n';
						
                      resultContent += '</div>';
                }
                
                $('.part.two').html(resultContent);
                
                /*
                console.log(locations_dok);
                console.log(locations_bh);
                */
            }
            else {
                console.log('not found');
            }
        });
        }        
    });
    
    $('.countries li').sort(function (a, b) {        
        var contentA = $(a).attr('sort');
        var contentB = $(b).attr('sort');
        // console.log(contentA);
        // console.log(contentB);
        return (contentA < contentB) ? -1 : (contentA > contentB) ? 1 : 0;
   }).appendTo($(".countries"));
});

function initialize() {
    var mapOptions = {            
        zoom: 7,
        disableDefaultUI: true,
        zoomControl: true,
        styles: [
            {
                "featureType": "all",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "weight": "2.00"
                    }
                ]
            },
            {
                "featureType": "all",
                "elementType": "geometry.stroke",
                "stylers": [
                    {
                        "color": "#e20612"
                    },
                    {
                        "weight": "1.5"
                    }
                ]
            },
            {
                "featureType": "all",
                "elementType": "labels.text",
                "stylers": [
                    {
                        "visibility": "on"
                    }
                ]
            },
            {
                "featureType": "administrative.country",
                "elementType": "geometry.stroke",
                "stylers": [
                    {
                        "weight": "3"
                    }
                ]
            },
            {
                "featureType": "administrative.province",
                "elementType": "geometry.stroke",
                "stylers": [
                    {
                        "color": "#c7c7c7"
                    }
                ]
            },
            {
                "featureType": "landscape",
                "elementType": "all",
                "stylers": [
                    {
                        "color": "#f2f2f2"
                    }
                ]
            },
            {
                "featureType": "landscape",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#ffffff"
                    }
                ]
            },
            {
                "featureType": "landscape.man_made",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#ffffff"
                    }
                ]
            },
            {
                "featureType": "poi",
                "elementType": "all",
                "stylers": [
                    {
                        "visibility": "off"
                    }
                ]
            },
            {
                "featureType": "road",
                "elementType": "all",
                "stylers": [
                    {
                        "saturation": -100
                    },
                    {
                        "lightness": 45
                    }
                ]
            },
            {
                "featureType": "road",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#eeeeee"
                    }
                ]
            },
            {
                "featureType": "road",
                "elementType": "labels.text.fill",
                "stylers": [
                    {
                        "color": "#7b7b7b"
                    }
                ]
            },
            {
                "featureType": "road",
                "elementType": "labels.text.stroke",
                "stylers": [
                    {
                        "color": "#ffffff"
                    }
                ]
            },
            {
                "featureType": "road.highway",
                "elementType": "all",
                "stylers": [
                    {
                        "visibility": "simplified"
                    }
                ]
            },
            {
                "featureType": "road.arterial",
                "elementType": "labels.icon",
                "stylers": [
                    {
                        "visibility": "off"
                    }
                ]
            },
            {
                "featureType": "transit",
                "elementType": "all",
                "stylers": [
                    {
                        "visibility": "off"
                    }
                ]
            },
            {
                "featureType": "water",
                "elementType": "all",
                "stylers": [
                    {
                        "color": "#c5c5c5"
                    },
                    {
                        "visibility": "on"
                    }
                ]
            },
            {
                "featureType": "water",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#e5e5e5"
                    }
                ]
            },
            {
                "featureType": "water",
                "elementType": "labels.text.fill",
                "stylers": [
                    {
                        "color": "#070707"
                    }
                ]
            },
            {
                "featureType": "water",
                "elementType": "labels.text.stroke",
                "stylers": [
                    {
                        "color": "#ffffff"
                    }
                ]
            }
        ]
    };
    
    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
    var geocoder = new google.maps.Geocoder();
    
    geocoder.geocode({ 'address': 'Lithuania' }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var s = parseLocation(results[0].geometry.location);  
			// console.log(s);
            map.setCenter(new google.maps.LatLng(s[0],s[1], 6));
        }
        else
        {}
    });

    for (k in locations_dok) {
        var popupContent = '<div id="mapBox"><h4>' + locations_dok[k][10] + '</h4>\n\
            ' + locations_dok[k][5] + '<BR>\n\
            ' + locations_dok[k][4] + ' ' + locations_dok[k][3] + '<BR>\n\
            Tel: ' + locations_dok[k][6] + '<BR>\n';
			if(locations_dok[k][7] != "")
				popupContent += 'Faksas ' + locations_dok[k][7] + '<BR>\n';
			popupContent += 'Darbo laikas: I-V 8 - 17 val.\n';
			popupContent += '</div>';
        var infoWindow = new google.maps.InfoWindow();
  
        var marker = new google.maps.Marker({
                position: new google.maps.LatLng(locations_dok[k][9],locations_dok[k][8],6),
                map: map,
                group: 'bh',
                visible: dok,
                draggable: false,
                raiseOnDrag: false,
                icon: urlHost + 'img/front/svg/pin_normal.svg',
                title: locations_dok[k][4],
                content:popupContent
        });

        google.maps.event.addListener(marker, 'click', function() {
            infoWindow.setContent(this.content);
            infoWindow.open(map, this);
        });
        arrDok[k]=[];
        arrDok[k].push(marker);
    }
      
      
    for (k in locations_bh) {
        var popupContent = '<div id="mapBox"><h4>' + locations_bh[k][10] + '</h4>\n\
            ' + locations_bh[k][5] + '<BR>\n\
            ' + locations_bh[k][4] + ' ' + locations_bh[k][3] + '<BR>\n\
            Tel: ' + locations_bh[k][6] + '<BR>\n';
			if(locations_bh[k][7] != "")
				popupContent += 'Faksas: ' + locations_bh[k][7] + '<BR>\n';
			popupContent += 'Darbo laikas: I-V 8 - 17 val.\n';
			popupContent += '</div>';
        var infoWindow = new google.maps.InfoWindow();
          
        var marker = new google.maps.Marker({
                  position: new google.maps.LatLng(locations_bh[k][9],locations_bh[k][8],6),
                  map: map,
                  group: 'bh',
                  visible: bh,
                  draggable: false,
                  raiseOnDrag: false,
                  icon: urlHost + 'img/front/svg/pin_active.svg',
                  title: locations_bh[k][2],
                 content:popupContent
                  
            });
              
            google.maps.event.addListener(marker, 'click', function() {
                infoWindow.setContent(this.content);
                infoWindow.open(map, this);
            });
            arrBh[k]=[];
            arrBh[k].push(marker);
      }     
  }
      
function parseLocation(location) {
    var lat = location.lat().toString().substr(0, 12);
    var lng = location.lng().toString().substr(0, 12);
    var arr = [];
    
    arr[0] = lat;
    arr[1] = lng;
    return arr;
}

function distance(lat1, lng1, lat2, lng2) {
    var p = 0.017453292519943295;    // Math.PI / 180
    var c = Math.cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 + 
            c(lat1 * p) * c(lat2 * p) * 
            (1 - c((lng2 - lng1) * p))/2;

    return 12742 * Math.asin(Math.sqrt(a)); // 2 * R; R = 6371 km
}