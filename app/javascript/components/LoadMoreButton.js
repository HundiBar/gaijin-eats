import React from 'react'

const LoadMoreButton = ({ loadMore }) => {
  return (
    <div className="load-more-button">
      <button onClick={loadMore}>Load more</button>
    </div>
  )
}

export default LoadMoreButton
