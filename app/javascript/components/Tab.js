import React from 'react'

const Tab = ({ cuisine, filterByCousine }) => {
  return (
    <div className="tab">
      <button value={cuisine} onClick={filterByCousine}>{cuisine}</button>
    </div>

  )
}

export default Tab
