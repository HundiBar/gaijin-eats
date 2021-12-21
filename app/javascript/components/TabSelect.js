import React from 'react'

function TabSelect({ cuisines, filterByCousine }) {

  let index = 0;
  let options = cuisines.map((cuisine) => {
    index += 1;
    return <option key={index} value={cuisine} onClick={filterByCousine}>{cuisine}</option>
  })

  return (
    <select className='cusine-select'>
      {options}
    </select>
  )
}

export default TabSelect
