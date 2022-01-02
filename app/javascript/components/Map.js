import React, { useState } from 'react'
import {
  GoogleMap,
  Marker,
  InfoWindow,
  MarkerClusterer,
} from '@react-google-maps/api';

const containerStyle = {
  width: '100%',
  height: '400px',
};

const Map = (props) => {
  const [selected, setSelected] = useState(null)

  const position = {
    lat: props.center[0],
    lng: props.center[1],
  };

  const imageClick =
    "https://maps.gstatic.com/mapfiles/kml/paddle/wht-circle-lv.png";

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
                icon={imageClick}
                onClick={() => {
                  setSelected(marker)
                }}
              />
            )
          }
        </MarkerClusterer>

        {selected ?
          (<InfoWindow
            position={{ lat: selected.lat, lng: selected.lng }}
            onCloseClick={() => {
              setSelected(null)
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
