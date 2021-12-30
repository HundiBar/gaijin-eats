import React from 'react'

export default function Navbar() {
  return (
    <nav className="nav-wrapper">
      <div className="nav--title">
        <a href='https://gaijin-eats.herokuapp.com/'>
          <h1 className="nav--main-title">Gaijin <span id="eats-title-light-font">Eats</span></h1>
        </a>
        <p className="nav--sub-title">For when you miss that home flavor</p>

      </div>
    </nav>
  )
}

