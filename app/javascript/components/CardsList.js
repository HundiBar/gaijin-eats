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
        url = {place.url}
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
          url={place.url}
        >

        </Card>
      )
    }
  })
  return (
    <div className="card-wrapper">
      <div className="card">
        <h2 className="cards--title">Cafes &amp; Restaurants</h2>
        <p className="cards--subtitle">Find that homey flavor you’ve been craving from back home</p>
        <div className="cards">
          {cardsRenderRestaurants}
        </div>
        <div className="load-more-button">
          <button>Load more</button>
        </div>
      </div>
      <div className="card">
        <h2 className="cards--title">Supermarkets</h2>
        <p className="cards--subtitle">The places that can make your home feel like home again</p>
        <div className="cards">
          {cardsRenderSupermarkets}
        </div>
        <div className="load-more-button">
          <button>Load more</button>
        </div>
      </div>
    </div>
  )
}



export default cardsList
