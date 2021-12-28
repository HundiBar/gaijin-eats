import React from "react";

export default function Form() {
  return (
    <>
      <div className="form--wrapper">
        <h1 className="form--title">Submit a location</h1>
        <p className="form--subtitle">Once submitted, it may take a few days for your location to show up.</p>
        <form action="https://getform.io/f/776f5d76-8ecc-4234-bb5b-9d7401f496ec" method="POST">
          <div className="form-group">
            <label className="input-title required" id="location" for="location">Location name</label>
            <input type="text" name="location" class="form-control" id="location" required/>
          </div>
          <div className="form-group">
            <label className="input-title required" id="googlelink" for="googlelink">Google map link</label>
            <input type="text" name="googlelink" className="form-control" id="googlelink" required />
          </div>
          <div className="form-group">
            <label className="input-title required" id="googleimagelink" for="googleimagelink">Google image link</label>
            <label className="input-subtitle" for="googleimagelink">Image that best represents the place</label>
            <input type="text" name="googleimagelink" className="form-control" id="googleimagelink" required/>
          </div>
          <div className="form-group">
            <label className="input-title required" id="placetags" for="placetags">Place tags</label>
            <label className="input-subtitle" for="placetags">Ex: American; International. Add tags separated by commas.</label>
            <input type="text" name="placetags" className="form-control" id="placetags" required/>
          </div>
          <div className="form-group">
            <label className="input-title" id="contactinfo" for="exampleFormControlInput1">Your contact information</label>
            <label className="input-subtitle" for="contactinfo">Email address and/or name</label>
            <input type="text" name="contactinfo" className="form-control" id="contactinfo"/>
          </div>
          <button type="submit" className="submit-button">Submit</button>
        </form>
      </div>
    </>
  )
}
