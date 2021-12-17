import React, { useState } from "react";
import Tab from './Tab';
import CardsList from "./CardsList";

const Tabs = ({ places }) => {
  const [placesFiltered, setPlaces] = useState(places)
  const cuisinesArr = ['All', 'American', 'Brazilian', 'Taiwanese', 'Indian', 'Mexican', 'Cuban', 'British', 'International'];
  let index = 0;

  const filterByCousine = (e) => {
    let placesFiltered;
    if (e.target.value === 'All') {
      placesFiltered = places;
    } else {
      placesFiltered = places.filter((place) => place.cuisine.includes(e.target.value));
    }
    setPlaces(placesFiltered)
  }


  let cuisines = cuisinesArr.map((cuisine) => {
    index += 1;
    return (
      <Tab key={index} cuisine={cuisine} filterByCousine={filterByCousine}>
      </Tab>
    )
  })


  return (
    <div>
      <div className="content-wrapper">
        <div className='tabs-section'>
          <h2>Filter by cuisine</h2>
          <div className="cuisines-wrapper">
            {cuisines}
          </div>
        </div>
        <CardsList places={placesFiltered}></CardsList>
      </div>
    </div>
  )
}


export default Tabs
