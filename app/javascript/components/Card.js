import React from 'react'

export default function Card(props) {
  console.log(props)
  return (
    <div className="card">
      <h1 className="card--title"><a href={`https://www.google.com/maps/place/${props.name}/${props.address}`} target="_blank">{props.name}</a></h1>
      <p className="card--address">{props.address}</p>
    </div>
  )
}
