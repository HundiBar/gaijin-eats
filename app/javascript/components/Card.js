import React from 'react'

const Card =({name,photo_url,url,cuisine,supermarket}) => {
  return(
    <div className="card">
      <img src={photo_url} alt="no"/>
      <p>{name}</p>
      <p>{cuisine}</p>
    </div>

  )
}

export default Card
