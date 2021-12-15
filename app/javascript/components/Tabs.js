import React from 'react'
import Tab from './Tab';

const Tabs = () => {
  const cuisinesArr = ['American', 'Brazilian', 'Taiwanese', 'Indian', 'Mexican', 'Cuban', 'British', 'International'];
  let index = 0;
  let cuisines = cuisinesArr.map((cuisine) => {
    index += 1;
    return (
      <Tab key={index} cuisine={cuisine}>
      </Tab>
    )
  })


  return (
    <div className='tabs-section'>
      <h2>Filter by cuisine</h2>
      <div className="cuisines-wrapper">
        {cuisines}
      </div>
    </div>
  )
}

export default Tabs