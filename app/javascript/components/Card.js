import React from 'react'

export default function Card(props) {
  console.log(props)
  return (
    <div>
      <h1><a href={`https://www.google.com/maps/place/${props.name}/${props.address}`} target="_blank">{props.name}</a></h1>
    </div>
  )
}
