import React from "react";
import Card from "./Card";

const cardsList = ({places}) => {
  let cardsRender = places.map((place) => {
    return (
    <Card
      key={place.id}
      name={place.name}
      photo_url={place.photo_url}
      cuisine={place.cuisine}
      supermarket={place.supermarket}
    >

    </Card>
    )
  })
  return (
    <div className="card-wrapper">
      {cardsRender}
    </div>
  )
}

export default cardsList
