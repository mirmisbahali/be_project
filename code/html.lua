_html = [[
  <!DOCTYPE html>
  <html lang="en">
  
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modelling and Analysis of a Robotic Arm with Gripper Mechanism</title>
    <style>
      * {
        margin: 0; padding: 0; box-sizing: border-box;
      }
  
      body {
        width: 100vw; height: 100vh; display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }
  
      #title {
        margin: 0 auto 2rem auto;
        text-align: center;
      }
  
      .form-group {
        padding: 1.2rem 0;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
  
      .form-group label {
        padding: 0 0.5rem;
        width: 50vw;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
    </style>
  </head>
  
  <body>
    <h1 id="title">Modelling and Analysis of a Robotic Arm with Gripper Mechanism</h1>
    <div id="form">
      <div class="form-group">
        <label for="clawServo">Gripper <span>&theta;4 = <span id="clawServoV"></span></span></label>
        <input onchange="slider(this)" type="range" name="clawServo" id="clawServo" min="0" max="180">
      </div>
      <div class="form-group">
        <label for="leftServo">Left Servo <span>&theta;3 = <span id="leftServoV"></span></span></label>
        <input onchange="slider(this)" type="range" name="leftServo" id="leftServo" min="0" max="180">
      </div>
      <div class="form-group">
        <label for="rightServo">Right Servo <span>&theta;2 = <span id="rightServoV"></span></span></label>
        <input onchange="slider(this)" type="range" name="rightServo" id="rightServo" min="0" max="180">
      </div>
      <div class="form-group">
        <label for="baseServo">Base Servo  <span>&theta;1 = <span id="baseServoV"></span></span></label>
        <input onchange="slider(this)" type="range" name="baseServo" id="baseServo" min="0" max="180">
      </div>
    </div>
    <script>
      function slider(el) {
        console.log(`Name: ${el.name}`)
        console.log(`Value: ${el.value}`)
  
        document.querySelector(`#${el.name}V`).innerHTML = `${el.value}&deg;`
  
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function () {
          console.log(el);
        }
        xhttp.open("GET", `/slider?name=${el.name}&value=${el.value}`, true);
        xhttp.send();
      }
    </script>
  </body>
  
  </html>
  ]]