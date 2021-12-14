import React from 'react'

const Cards =(props) => {
  console.log(props)
  // const [cards, setCards] = useState(props);

  return (
    <div>
      <div>
        <h2 className="categories--title">Filter by cuisine</h2>
        <button>American</button>
        <button>British</button>
        <button>Indian</button>
        <button>Mexican</button>
        <button>Taiwanese</button>
        <button>Cuban</button>
      </div>
      <div className="cards">
        {
        props.places.forEach(placeInfo => {
          console.log(placeInfo)
          return (
            <p>{placeInfo}</p>
          )
        })
        }
      </div>


    </div>
  )
}

export default Cards
