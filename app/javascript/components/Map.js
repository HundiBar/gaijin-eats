import React, { useState } from 'react'
import {
  GoogleMap,
  Marker,
  InfoWindow,
  MarkerClusterer,
  Autocomplete,
} from '@react-google-maps/api';

const containerStyle = {
  width: '100%',
  height: '400px',
  marginRight: 10,
};

const Map = (props) => {
  const [selected, setSelected] = useState(null)

  const position = {
    lat: props.center[0],
    lng: props.center[1],
  };

  return (
    <div className="map-wrapper">
      <GoogleMap
        mapContainerStyle={containerStyle}
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
            <div style={{ maxWidth: 120 }}>
              <img style={{objectFit: 'contain', width: 120, height: 120}} src={selected.img} alt="no"/>
              <a href={selected.url} target="_blank"><p>{selected.name}</p></a>
              <small>{selected.address}</small>
            </div>
          </InfoWindow>) : null}
      </GoogleMap>
    </div>
  )
}

export default Map
