import React, {useState} from "react";

const button = () => {
  const [resize, setResize] = useState(window.innerWidth)

  const handleResize = () => {
    setResize(window.innerWidth);
  };

  window.addEventListener("resize", handleResize);
  const buttonSelect = () => {
    if (resize <= 500) {
      return (
        <div>
          <button className="submit-location-phone" >Submit</button>
        </div>
      )
    } else {
      return (
        <div>
          <button className="submit-location-button" >Submit a location</button>
        </div>
      )
    }
  }
  return (
    <>
      {buttonSelect()}
    </>
  )
}

export default button
