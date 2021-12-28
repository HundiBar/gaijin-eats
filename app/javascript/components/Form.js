import React from "react";

export default function Form() {
  return (
    <>
      <div className="form--wrapper">
        <h1>Submit a location</h1>
        <p>Once submitted, it may take a few days for your location to show up.</p>
        <form action="https://getform.io/f/776f5d76-8ecc-4234-bb5b-9d7401f496ec" method="POST">
          <div class="form-group">
            <label id="location" for="location">Location name</label>
            <input type="text" name="location" class="form-control" id="location"/>
          </div>
          <div class="form-group">
            <label id="googlelink" for="googlelink">Google map link</label>
            <input type="text" name="googlelink" class="form-control" id="googlelink" />
          </div>
          <div class="form-group">
            <label id="googleimagelink" for="googleimagelink">Google image link</label>
            <label for="googleimagelink">Image that best represents the place</label>
            <input type="text" name="googleimagelink" class="form-control" id="googleimagelink" />
          </div>
          <div class="form-group">
            <label id="placetags" for="placetags">Place tags</label>
            <label for="placetags">Ex: American; International. Add tags separated by commas.</label>
            <input type="text" name="placetags" class="form-control" id="placetags" />
          </div>
          <div class="form-group">
            <label id="contactinfo" for="exampleFormControlInput1">Your contact information</label>
            <label for="contactinfo">Email address and/or name</label>
            <input type="text" name="contactinfo" class="form-control" id="contactinfo"/>
          </div>
          <button type="submit" class="website-button">Submit</button>
        </form>
      </div>
    </>
  )
}
