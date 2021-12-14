import React from "react";
import Card from "./Card";

const cardsList = (props) => {
  let cardsRender = props.places.map((place) => {
    return (
    <Card
      key={place.id}
      name={place.name}
    >

    </Card>
    )
  })
  return (
    <div>
      {cardsRender}
    </div>
  )
}

export default cardsList
