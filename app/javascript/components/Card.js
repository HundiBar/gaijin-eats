import React from 'react'

const Card = ({ name, photo_url, url, cuisine, supermarket }) => {
  return (
    <div className="card">
      <img src={photo_url} alt="no" />
      <p className='place-name'>{name}</p>
      <p className='cuisine'>{cuisine}</p>
    </div>

  )
}

export default Card
