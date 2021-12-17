import React from 'react'

const Card = ({ name, photo_url, url, cuisine, supermarket }) => {
  return (
    <>
      <a className='card--link' target="_blank" href={url}>
        <div className="card">
          <img src={photo_url} alt="no" />
          <p className="card--name">{name}</p>
          <p className="card--cuisine">{cuisine}</p>
        </div>
      </a>
    </>

  )
}

export default Card
