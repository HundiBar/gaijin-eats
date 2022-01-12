import { faMapMarkerAlt } from "@fortawesome/free-solid-svg-icons";
import React, { useState } from 'react';
import {
  GoogleMap,
  Marker,
  InfoWindow,
  MarkerClusterer,
} from '@react-google-maps/api';
import mapStyles from "./mapStyles.js";

console.log(faMapMarkerAlt)

const containerStyle = {
  width: '100%',
  height: '400px',
};

const Map = (props) => {
  const [selected, setSelected] = useState(0)
  const [resize, setResize] = useState(window.innerWidth)

  const handleResize = () => {
    setResize(window.innerWidth);
  };

  window.addEventListener("resize", handleResize);

  const position = {
    lat: props.center[0],
    lng: props.center[1],
  };

  const imageClick =
  {
    path: faMapMarkerAlt.icon[4],
    fillColor: "#000000",
    fillOpacity: 1,
    anchor: new google.maps.Point(
      faMapMarkerAlt.icon[0] / 2, // width
      faMapMarkerAlt.icon[1] // height
    ),
    strokeWeight: 0.75,
    strokeColor: "",
    scale: 0.05,
  };

  const imageNoClick =
  {
    path: faMapMarkerAlt.icon[4],
    fillColor: "#F09133",
    fillOpacity: 1,
    anchor: new google.maps.Point(
      faMapMarkerAlt.icon[0] / 2, // width
      faMapMarkerAlt.icon[1] // height
    ),
    strokeWeight: 1,
    strokeColor: "#000000",
    scale: 0.07,
  };

  return (
    <div className="map-wrapper">
      <GoogleMap
        mapContainerStyle={containerStyle}
        options={{
          styles: mapStyles
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
              <div className="present" style={resize <= 500 ? { maxWidth: 200 } : { maxWidth: 275 }}>
                <img style={{ overflow: scroll, width: '100%', height: 127 }} src={selected.img} alt="no" />
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
