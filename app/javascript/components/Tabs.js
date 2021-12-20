import React, { useState } from "react";
import Tab from './Tab';
import CardsList from "./CardsList";
import TabSelect from "./TabSelect";

const Tabs = ({ places }) => {
  const [placesFiltered, setPlaces] = useState(places)
  const [resize, setResize] = useState(window.innerWidth)

  const handleResize = (e) => {
    setResize(window.innerWidth);
  };

  window.addEventListener("resize", handleResize);


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

  const cuisinesSelect = () => {
    if (resize <= 414) {
      return (
        <TabSelect cuisines={cuisinesArr} filterByCousine={filterByCousine}></TabSelect>
      )
    } else {
      return cuisines
    }
  }

  return (
    <div>
      <div className="content-wrapper">
        <div className='tabs-section'>
          <h2>Filter by cuisine</h2>
          <div className="cuisines-wrapper">
            {/* {window.innerWidth <= resize ? <TabSelect cuisines={cuisinesArr} filterByCousine={filterByCousine}></TabSelect> : cuisines} */}
            {cuisinesSelect()}
          </div>
        </div>
        <CardsList places={placesFiltered}></CardsList>
      </div>
    </div>
  )
}


export default Tabs
