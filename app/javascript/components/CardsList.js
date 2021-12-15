import React from "react";
import Card from "./Card";

const cardsList = ({places}) => {
  let cardsRenderRestaurants = places.map((place) => {
    if (place.supermarket === "no") {
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
    }
  })
  let cardsRenderSupermarkets = places.map((place) => {
    if (place.supermarket === "yes") {
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
    }
  })
  return (
    <div className="card-wrapper">
      {cardsRenderRestaurants}
      <h2> Whadddup bitches!</h2>
      {cardsRenderSupermarkets}
    </div>
  )
}

export default cardsList
