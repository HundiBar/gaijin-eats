import { faMapMarkerAlt } from "@fortawesome/free-solid-svg-icons";
import React, { useState } from 'react'
import {
  GoogleMap,
  Marker,
  InfoWindow,
  MarkerClusterer,
} from '@react-google-maps/api';

console.log(faMapMarkerAlt)

const containerStyle = {
  width: '100%',
  height: '400px',
};

const Map = (props) => {
  const [selected, setSelected] = useState(0)

  const position = {
    lat: props.center[0],
    lng: props.center[1],
  };

  const imageClick =
  {
    path: faMapMarkerAlt.icon[4],
    fillColor: "#0000ff",
    fillOpacity: 1,
    anchor: new google.maps.Point(
      faMapMarkerAlt.icon[0] / 2, // width
      faMapMarkerAlt.icon[1] // height
    ),
    strokeWeight: 1,
    strokeColor: "#ffffff",
    scale: 0.075,
  };

  const imageNoClick = "https://maps.gstatic.com/mapfiles/kml/paddle/purple-blank.png";

  return (
    <div className="map-wrapper">
      <GoogleMap
        mapContainerStyle={containerStyle}
        options={{
          styles: [
            {
              "featureType": "administrative",
              "elementType": "all",
              "stylers": [
                {
                  "saturation": "-100"
                }
              ]
            },
            {
              "featureType": "administrative.province",
              "elementType": "all",
              "stylers": [
                {
                  "visibility": "off"
                }
              ]
            },
            {
              "featureType": "landscape",
              "elementType": "all",
              "stylers": [
                {
                  "saturation": -100
                },
                {
                  "lightness": 65
                },
                {
                  "visibility": "on"
                }
              ]
            },
            {
              "featureType": "poi",
              "elementType": "all",
              "stylers": [
                {
                  "saturation": -100
                },
                {
                  "lightness": "50"
                },
                {
                  "visibility": "simplified"
                }
              ]
            },
            {
              "featureType": "road",
              "elementType": "all",
              "stylers": [
                {
                  "saturation": "-100"
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
              "elementType": "all",
              "stylers": [
                {
                  "lightness": "30"
                }
              ]
            },
            {
              "featureType": "road.local",
              "elementType": "all",
              "stylers": [
                {
                  "lightness": "40"
                }
              ]
            },
            {
              "featureType": "transit",
              "elementType": "all",
              "stylers": [
                {
                  "saturation": -100
                },
                {
                  "visibility": "simplified"
                }
              ]
            },
            {
              "featureType": "water",
              "elementType": "geometry",
              "stylers": [
                {
                  "hue": "#ffff00"
                },
                {
                  "lightness": -25
                },
                {
                  "saturation": -97
                }
              ]
            },
            {
              "featureType": "water",
              "elementType": "labels",
              "stylers": [
                {
                  "lightness": -25
                },
                {
                  "saturation": -100
                }
              ]
            }
          ]
        }}
        center={position}
        zoom={props.zoom}
      >
        <MarkerClusterer
          minimumClusterSize='10'
        >
          {(clusterer) =>
            props.markers[0].map(marker =>
              <Marker
                key={marker.id}
                animation={2}
                position={{
                  lat: marker.lat,
                  lng: marker.lng,
                }}
                clusterer={clusterer}
                icon={marker.id === selected.id ? imageNoClick : imageClick}
                onClick={() => {
                  setSelected(marker)
                }}
              />
            )
          }
        </MarkerClusterer>

        {selected ?
          (<InfoWindow
            position={{ lat: selected.lat, lng: selected.lng}}
            options={{ pixelOffset: new google.maps.Size(0, -50) }}
            onCloseClick={() => {
              setSelected(0)
            }}
          >
            <a href={selected.url} style={{ textDecoration: 'none' }} target="_blank">
              <div className="present" style={{ maxWidth: 322 }}>
                <img style={{ objectFit: 'cover', width: '100%', height: 127 }} src={selected.img} alt="no" />
                <p style={{ color: '#000', fontWeight: 'bold' }}>{selected.name}</p>
                <small style={{ color: '#4D4D4D', fontStyle: 'italic', fontWeight: '300' }}>{selected.address}</small>
              </div>
            </a>
          </InfoWindow>) : null}
      </GoogleMap>
    </div>
  )
}


export default Map
