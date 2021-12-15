import React from 'react'

const Card =({name,photo_url,url,cuisine,supermarket}) => {
  return(
    <div className="restaurant-card">
      <img src={photo_url} alt="no"/>
      <p className="restaurant-card--name">{name}</p>
      <p className="restaurant-card--cuisine">{cuisine}</p>
    </div>

  )
}

export default Card
