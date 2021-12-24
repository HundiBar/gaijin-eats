import React from "react";

export default function Form() {
  return (
    <div>
      <form action="https://getform.io/f/776f5d76-8ecc-4234-bb5b-9d7401f496ec" method="POST">
        <div class="form-group">
          <label id="emailinput" for="exampleFormControlInput1">EMAIL ADDRESS</label>
          <input type="email" name="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com"/>
        </div>
        <div class="form-group">
          <label id="messageinput" for="exampleFormControlTextarea1">MESSAGE</label>
          <textarea class="form-control" name="message" id="exampleFormControlTextarea1" rows="5"></textarea>
        </div>
        <button type="submit" class="website-button">Submit</button>
      </form>
    </div>
  )
}
