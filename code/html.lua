_html = [[
    <!DOCTYPE html>
    <html lang="en">
    
    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Slider</title>
      <style>
        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
        }
    
        body {
          width: 100vw;
          height: 100vh;
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
        }
        .form-group {
          padding: 1.2rem 0;
          display: flex;
          justify-content: space-between;
          align-items: center;
        }
    
        .form-group label {
          padding: 0 0.5rem;
        }
      </style>
    </head>
    
    <body>
      <div class="form-group">
        <label for="clawServo">Claw</label>
        <input onchange="slider(this)" type="range" name="clawServo" id="clawServo" min="0" max="180">
      </div>
      <div class="form-group">
        <label for="leftServo">Left</label>
        <input onchange="slider(this)" type="range" name="leftServo" id="leftServo" min="0" max="180">
      </div>
      <div class="form-group">
        <label for="rightServo">Right</label>
        <input onchange="slider(this)" type="range" name="rightServo" id="rightServo" min="0" max="180">
      </div>
      <div class="form-group">
        <label for="baseServo">Base</label>
        <input onchange="slider(this)" type="range" name="baseServo" id="baseServo" min="0" max="180">
      </div>
      <script>
        function slider(el) {
          console.log(`Name: ${el.name}`)
          console.log(`Value: ${el.value}`)
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