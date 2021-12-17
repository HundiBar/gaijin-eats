import React, { useState, useEffect } from "react";
import Card from "./Card";
import LoadMoreButton from "./LoadMoreButton";



const cardsList = ({ places }) => {
  const [items, setItems] = useState([]);
  const [visibleRestaurants, setVisibleRestaurants] = useState(3);
  const [visibleSupermarkets, setVisibleSupermarkets] = useState(3);

  useEffect(() => {
    setItems(places)
  })

  const loadMoreRestaurants = () => {
    setVisibleRestaurants((prevValue) => prevValue + 3)
  }

  const loadMoreSupermarkets = () => {
    setVisibleSupermarkets((prevValue) => prevValue + 3)
  }

  const restaurants = items.filter((place) => place.supermarket === "no")
  let cardsRenderRestaurants = restaurants.slice(0, visibleRestaurants).map((place) => {
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
  })

  const supermarkets = items.filter((place) => place.supermarket === "yes")
  let cardsRenderSupermarkets = supermarkets.slice(0, visibleSupermarkets).map((place) => {
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
  })

  return (
    <div className="card-wrapper">
      <div className="card">
        <h2 className="cards--title">Cafes &amp; Restaurants</h2>
        <p className="cards--subtitle">Find that homey flavor you’ve been craving from back home</p>
        <div className="cards">
          {cardsRenderRestaurants}
        </div>
        <LoadMoreButton loadMore={loadMoreRestaurants}></LoadMoreButton>
      </div>
      <div className="card">
        <h2 className="cards--title">Supermarkets</h2>
        <p className="cards--subtitle">The places that can make your home feel like home again</p>
        <div className="cards">
          {cardsRenderSupermarkets}
        </div>
        <LoadMoreButton loadMore={loadMoreSupermarkets}></LoadMoreButton>
      </div>
    </div>
  )
}



export default cardsList
