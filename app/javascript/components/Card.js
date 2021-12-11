import React from 'react'

const Card =(props) => {
  console.log(props)
  return (
    <div className="card">
      <h1 className="card--title"><a href={props.url} target="_blank">{props.name}</a></h1>
      <p className="card--address">{props.address}</p>
    </div>
  )
}

export default Card
