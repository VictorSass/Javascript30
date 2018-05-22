puts "Launching test seed"
puts "Destroying previous entries"
Draft.destroy_all
puts "Creating new entries"

d1 = Draft.create!(name: "01 - JavaScript Drum Kit", completed: "Yes", intro: "In this exercise, we're gonna make a Javacript drumkit that play a
  sound when you hit the corresponding key but also do a subtle CSS animation. CURRENTLY TRYING TO FIX SOUND ISSUE !", completion: '<body>
  <div class="keys">
    <div data-key="65" class="key">
      <kbd>A</kbd>
      <span class="sound">Clap</span>
    </div>
    <div data-key="90" class="key">
      <kbd>Z</kbd>
      <span class="sound">Hihat</span>
    </div>
    <div data-key="69" class="key">
      <kbd>E</kbd>
      <span class="sound">Kick</span>
    </div>
    <div data-key="82" class="key">
      <kbd>R</kbd>
      <span class="sound">Openhat</span>
    </div>
    <div data-key="84" class="key">
      <kbd>T</kbd>
      <span class="sound">Boom</span>
    </div>
    <div data-key="89" class="key">
      <kbd>Y</kbd>
      <span class="sound">Ride</span>
    </div>
    <div data-key="85" class="key">
      <kbd>U</kbd>
      <span class="sound">Snare</span>
    </div>
    <div data-key="73" class="key">
      <kbd>I</kbd>
      <span class="sound">Tom</span>
    </div>
    <div data-key="79" class="key">
      <kbd>O</kbd>
      <span class="sound">Tink</span>
  </div>

  <audio data-key="65" src="/assets/sounds/clap.wav"></audio>
  <audio data-key="90" src="assets/sounds/hihat.wav"></audio>
  <audio data-key="69" src="sounds/kick.wav"></audio>
  <audio data-key="82" src="sounds/openhat.wav"></audio>
  <audio data-key="84" src="sounds/boom.wav"></audio>
  <audio data-key="89" src="sounds/ride.wav"></audio>
  <audio data-key="85" src="sounds/snare.wav"></audio>
  <audio data-key="73" src="sounds/tom.wav"></audio>
  <audio data-key="79" src="sounds/tink.wav"></audio>

<script>
  function playSound(e) {
    const audio = document.querySelector(`audio[data-key="${e.keyCode}"]`);
    audio.crossOrigin = "anonymous";
    const key = document.querySelector(`.key[data-key="${e.keyCode}"]`);
    if(!audio) return;
    audio.currentTime = 0;
    audio.play();
    console.log(key);
    key.classList.add("playing");
  }

  function removeTransition(e) {
    if(e.propertyName !== "transform") return;
    this.classList.remove("playing");
  }

  const keys = document.querySelectorAll(".key");
  keys.forEach(key => key.addEventListener("transitionend", removeTransition));
  window.addEventListener("keydown", playSound);
</script>
')

d2 = Draft.create!(name: "02 - JS and CSS Clock", completed: "Yes", intro: "The goal of this exercise is to create a dynamic
 clock that takes the current time from Javascript and update itself every second.", completion: '<div class="clock">
      <div class="clock-face">
        <div class="hand hour-hand"></div>
        <div class="hand min-hand"></div>
        <div class="hand second-hand"></div>
      </div>
    </div>

  <style>
    .clock {
      width: 30rem;
      height: 30rem;
      border:20px solid white;
      border-radius:50%;
      margin:50px auto;
      position: relative;
      padding:2rem;
      box-shadow:
        0 0 0 4px rgba(0,0,0,0.1),
        inset 0 0 0 3px #EFEFEF,
        inset 0 0 10px black,
        0 0 10px rgba(0,0,0,0.2);
    }
    .clock-face {
      position: relative;
      width: 100%;
      height: 100%;
      transform: translateY(-3px);
    }
    .hand {
      width:50%;
      height:6px;
      background:black;
      position: absolute;
      top:50%;
      transform-origin: 100%;
      transform: rotate(90deg);
      transition: all 0.05s;
      transition-timing-function: cubic-bezier(0.1, 2.7, 0.58, 1);
    }
</style>

<script>
  const secondHand = document.querySelector(".second-hand");
  const minsHand = document.querySelector(".min-hand");
  const hourHand = document.querySelector(".hour-hand");
  function setDate() {
    const now = new Date();
    const seconds = now.getSeconds();
    const secondsDegrees = ((seconds / 60) * 360) + 90;
    secondHand.style.transform = `rotate(${secondsDegrees}deg)`;
    const mins = now.getMinutes();
    const minsDegrees = ((mins / 60) * 360) + ((seconds/60)*6) + 90;
    minsHand.style.transform = `rotate(${minsDegrees}deg)`;
    const hour = now.getHours();
    const hourDegrees = ((hour / 12) * 360) + ((mins/60)*30) + 90;
    hourHand.style.transform = `rotate(${hourDegrees}deg)`;
  }
  setInterval(setDate, 1000);
  setDate();
</script>')

d3 = Draft.create!(name: "03 - CSS Variables", completed: "Yes", intro:"Today's exercise will be about CSS variables, move any cursor to update the CSS in real time.", completion: '<body>
  <p><i>Update CSS Variables with <span class="hl">JS</span></i></p>

  <div class="controls">
    <label for="spacing">Spacing:</label>
    <input id="spacing" type="range" name="spacing" min="10" max="200" value="10" data-sizing="px">

    <label for="blur">Blur:</label>
    <input id="blur" type="range" name="blur" min="0" max="25" value="0" data-sizing="px">

    <label for="base">Base Color</label>
    <input id="base" type="color" name="base" value="#ffc600">
  </div>

  <img src="https://source.unsplash.com/7bwQXzbF6KE/800x500">

  <style>
    :root {
      --base: red;
      --spacing: 10px;
      --blur: 10px;
    }

    img {
    padding: var(--spacing);
    background: var(--base);
    filter: blur(var(--blur));
    }

    .hl {
      color: var(--base);
    }

    .controls {
      margin-bottom: 50px;
    }
    input {
      width:100px;
    }
  </style>

  <script>
    const inputs = document.querySelectorAll(".controls input");

    function handleUpdate() {
      const suffix = this.dataset.sizing || "";
      document.documentElement.style.setProperty(`--${this.name}`, this.value + suffix);
    }

    inputs.forEach(input => input.addEventListener("change", handleUpdate))
    inputs.forEach(input => input.addEventListener("mousemove", handleUpdate))
  </script>

</body>')

d4 = Draft.create!(name: "04 - Array Cardio Day 1", completed: "Yes", intro: "Today is all about array methods.",  completion: '<body>
  <p><em>To understand today`s exercise have a look at the JavaScript Console 💁 and the page sourcecode !</em> </p>
  <script>
    // Get your shorts on - this is an array workout!
    // ## Array Cardio Day 1
    // Some data we can work with
    const inventors = [
      { first: "Albert", last: "Einstein", year: 1879, passed: 1955 },
      { first: "Isaac", last: "Newton", year: 1643, passed: 1727 },
      { first: "Galileo", last: "Galilei", year: 1564, passed: 1642 },
      { first: "Marie", last: "Curie", year: 1867, passed: 1934 },
      { first: "Johannes", last: "Kepler", year: 1571, passed: 1630 },
      { first: "Nicolaus", last: "Copernicus", year: 1473, passed: 1543 },
      { first: "Max", last: "Planck", year: 1858, passed: 1947 },
      { first: "Katherine", last: "Blodgett", year: 1898, passed: 1979 },
      { first: "Ada", last: "Lovelace", year: 1815, passed: 1852 },
      { first: "Sarah E.", last: "Goode", year: 1855, passed: 1905 },
      { first: "Lise", last: "Meitner", year: 1878, passed: 1968 },
      { first: "Hanna", last: "Hammarström", year: 1829, passed: 1909 }
    ];

    const people = ["Beck, Glenn", "Becker, Carl", "Beckett, Samuel", "Beddoes, Mick", "Beecher, Henry", "Beethoven, Ludwig", "Begin, Menachem", "Belloc, Hilaire", "Bellow, Saul", "Benchley, Robert", "Benenson, Peter", "Ben-Gurion, David", "Benjamin, Walter", "Benn, Tony", "Bennington, Chester", "Benson, Leana", "Bent, Silas", "Bentsen, Lloyd", "Berger, Ric", "Bergman, Ingmar", "Berio, Luciano", "Berle, Milton", "Berlin, Irving", "Berne, Eric", "Bernhard, Sandra", "Berra, Yogi", "Berry, Halle", "Berry, Wendell", "Bethea, Erin", "Bevan, Aneurin", "Bevel, Ken", "Biden, Joseph", "Bierce, Ambrose", "Biko, Steve", "Billings, Josh", "Biondo, Frank", "Birrell, Augustine", "Black, Elk", "Blair, Robert", "Blair, Tony", "Blake, William"];
    // Array.prototype.filter()
    // 1. Filter the list of inventors for those who were born in the 15th century
      const fifteen = inventors.filter(inventor => inventor.year >= 1500 && inventor.year < 1600)
      console.table(fifteen);

    // Array.prototype.map()
    // 2. Give us an array of the inventors` first and last names
      const fullNames = inventors.map(inventor => `${inventor.first} + ${inventor.last}`);
      console.log(fullNames);

    // Array.prototype.sort()
    // 3. Sort the inventors by birthdate, oldest to youngest
      const ordered = inventors.sort((firstPerson, secondPerson) => firstPerson.year > secondPerson.year ? 1 : -1 );
      console.table(ordered);

    // Array.prototype.reduce()
    // 4. How many years did all the inventors live?
      const totalYears = inventors.reduce((total, inventor) => {
        return total + (inventor.passed - inventor.year);
      }, 0);
      console.log(totalYears);

    // 5. Sort the inventors by years lived
      const oldest = inventors.sort(function(a,b) {
        const lastGuy = a.passed - a.year;
        const nextGuy = b.passed - b.year;
        return lastGuy > nextGuy ? -1 : 1;
      });
      console.table(oldest);

    // 6. create a list of Boulevards in Paris that contain "de" anywhere in the name
    // https://en.wikipedia.org/wiki/Category:Boulevards_in_Paris
      // ! WORK ONLY ON THE WIKIPEDIA PAGE ABOVE !
      // const category = document.querySelector(".mw-category");
      // const links = Array.from(category.querySelectorAll("a"));
      // const de = links
      //         .map(link => link.textContent)
      //         .filter(streetName => streetName.includes("de"));

    // 7. sort Exercise
    // Sort the people alphabetically by last name
      const alpha = people.sort((lastOne, nextOne) => {
        const [aLast, aFirst] = lastOne.split(", ");
        const [bLast, bFirst] = nextOne.split(", ");
        return aLast > bLast ? 1 : -1;
      });
      console.log(alpha);

    // 8. Reduce Exercise
    // Sum up the instances of each of these
    const data = ["car", "car", "truck", "truck", "bike", "walk", "car", "van", "bike", "walk", "car", "van", "car", "truck" ];

    const transportation =  data.reduce(function(object, item) {
      if(!object[item]) {
        object[item] = 0;
      }
      object[item]++;
      return object;
    }, {});
    console.log(transportation);

  </script>
</body>')

d5 = Draft.create!(name: "05 - Flex Panel Gallery", completed: "Yes", intro: "Here is a flex gallery out of flexbox/CSS and a little bit of Javascript. Click on one of the words below to see the result.", completion: '<head>
  <meta charset="UTF-8">
  <title>Flex Panels 💪</title>
  <link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet" type="text/css">
</head><style>
html {
      box-sizing: border-box;
      font-family:"helvetica neue";
      font-size: 20px;
      font-weight: 200;
    }
    body {
      margin: 0;
    }
    *, *:before, *:after {
      box-sizing: inherit;
    }
    .panels {
      min-height:100vh;
      overflow: hidden;
      display: flex;
    }
    .panel {
      background:#6B0F9C;
      box-shadow:inset 0 0 0 5px rgba(255,255,255,0.1);
      color:white;
      text-align: center;
      align-items:center;
      /* Safari transitionend event.propertyName === flex */
      /* Chrome + FF transitionend event.propertyName === flex-grow */
      transition:
        font-size 0.7s cubic-bezier(0.61,-0.19, 0.7,-0.11),
        flex 0.7s cubic-bezier(0.61,-0.19, 0.7,-0.11),
        background 0.2s;
      font-size: 20px;
      background-size:cover;
      background-position:center;
      flex: 1;
      justify-content: center;
      align-items: center;
      display: flex;
      flex-direction: column;
    }

    .panel1 { background-image:url(https://source.unsplash.com/gYl-UtwNg_I/1500x1500); }
    .panel2 { background-image:url(https://source.unsplash.com/rFKUFzjPYiQ/1500x1500); }
    .panel3 { background-image:url(https://images.unsplash.com/photo-1465188162913-8fb5709d6d57?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&w=1500&h=1500&fit=crop&s=967e8a713a4e395260793fc8c802901d); }
    .panel4 { background-image:url(https://source.unsplash.com/ITjiVXcwVng/1500x1500); }
    .panel5 { background-image:url(https://source.unsplash.com/3MNzGlQM7qs/1500x1500); }

    .panel > * {
      margin:0;
      width: 100%;
      transition:transform 0.5s;
      flex: 1 0 auto;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .panel > *:first-child { transform: translateY(-100%); }
    .panel.open-active > *:first-child { transform: translateY(0); }
    .panel > *:last-child { transform: translateY(100%); }
    .panel.open-active > *:last-child { transform: translateY(0); }

    .panel p {
      text-transform: uppercase;
      font-family: "Amatic SC", cursive;
      text-shadow:0 0 4px rgba(0, 0, 0, 0.72), 0 0 14px rgba(0, 0, 0, 0.45);
      font-size: 2em;
    }
    .panel p:nth-child(2) {
      font-size: 4em;
    }
    .panel.open {
      font-size:40px;
      flex: 5;
    }
    .white {
      color: white;
    }
  </style>

  <div class="panels">
    <div class="panel panel1">
      <p class="white">Hey</p>
      <p class="white">Let`s</p>
      <p class="white">Dance</p>
    </div>
    <div class="panel panel2">
      <p class="white">Give</p>
      <p class="white">Take</p>
      <p class="white">Receive</p>
    </div>
    <div class="panel panel3">
      <p class="white">Experience</p>
      <p class="white">It</p>
      <p class="white">Today</p>
    </div>
    <div class="panel panel4">
      <p class="white">Give</p>
      <p class="white">All</p>
      <p class="white">You can</p>
    </div>
    <div class="panel panel5">
      <p class="white">Life</p>
      <p class="white">In</p>
      <p class="white">Motion</p>
    </div>
  </div>

  <script>
    const panels = document.querySelectorAll(".panel");

    function toggleOpen() {
      this.classList.toggle("open");
    }

    function toggleActive(e) {
      if(e.propertyName.includes("flex")) {
        this.classList.toggle("open-active");
      }
    }

    panels.forEach(panel => panel.addEventListener("click", toggleOpen));
    panels.forEach(panel => panel.addEventListener("transitionend", toggleActive));
  </script>')

d6 = Draft.create!(name: "06 - Type Ahead", completed: "Yes", intro: "Today, the goal is to create a feature that update suggestions everytime an input is made in the searchbar", completion: '<body>
  <style>
    html {
      box-sizing: border-box;
      font-family:"helvetica neue";
      font-size: 20px;
      font-weight: 200;
    }
    *, *:before, *:after {
      box-sizing: inherit;
    }
    input {
      width: 100%;
      padding:20px;
    }

    .search-form {
      max-width:400px;
      margin:50px auto;
    }

    input.search {
      margin: 0;
      text-align: center;
      outline:0;
      border: 10px solid #F7F7F7;
      width: 120%;
      left: -10%;
      position: relative;
      top: 10px;
      z-index: 2;
      border-radius: 5px;
      font-size: 40px;
      box-shadow: 0 0 5px rgba(0, 0, 0, 0.12), inset 0 0 2px rgba(0, 0, 0, 0.19);
    }

    .suggestions {
      margin: 0;
      padding: 0;
      position: relative;
      /*perspective:20px;*/
    }
    .suggestions li {
      background:white;
      list-style: none;
      border-bottom: 1px solid #D8D8D8;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.14);
      margin:0;
      padding:20px;
      transition:background 0.2s;
      display:flex;
      justify-content:space-between;
      text-transform: capitalize;
    }

    .suggestions li:nth-child(even) {
      transform: perspective(100px) rotateX(3deg) translateY(2px) scale(1.001);
      background: linear-gradient(to bottom,  #ffffff 0%,#EFEFEF 100%);
    }
    .suggestions li:nth-child(odd) {
      transform: perspective(100px) rotateX(-3deg) translateY(3px);
      background: linear-gradient(to top,  #ffffff 0%,#EFEFEF 100%);
    }

    span.population {
      font-size: 15px;
    }

    .hl {
      background:#ffc600;
    }
  </style>

  <form class="search-form">
    <input type="text" class="search" placeholder="City or State">
    <ul class="suggestions">
      <li>Filter for a city</li>
      <li>or a state</li>
    </ul>
  </form>

<script>
const endpoint = "https://gist.githubusercontent.com/Miserlou/c5cd8364bf9b2420bb29/raw/2bf258763cdddd704f8ffd3ea9a3e81d25e2c6f6/cities.json";

const cities = [];
fetch(endpoint).then(blob => blob.json())
               .then(data => cities.push(...data))

function findMatches(wordToMatch, cities) {
  return cities.filter(place => {
    const regex = new RegExp(wordToMatch, "gi");
    return place.city.match(regex) || place.state.match(regex)
  });
}

function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function displayMatches() {
  const matchArray = findMatches(this.value, cities);
  const html = matchArray.map(place => {
    const regex = RegExp(this.value, "gi");
    const cityName = place.city.replace(regex, `<span class="hl">${this.value}</span>`)

    return `
      <li>
        <span class="name">${cityName}, ${place.state}</span>
        <span class="population">${numberWithCommas(place.population)}</span>
      </li>
    `
  }).join("");
  suggestions.innerHTML = html;
}

const searchInput = document.querySelector(".search");
const suggestions = document.querySelector(".suggestions");

searchInput.addEventListener("change", displayMatches);
searchInput.addEventListener("keyup", displayMatches);
</script>

  </body>')

d7 = Draft.create!(name: "07 - Array Cardio Day 2", completed: "Yes", intro: "", completion: "<body>
  <p><em>To understand today`s exercise have a look at the JavaScript Console 💁 and the page sourcecode !</p>
  <script>
    // ## Array Cardio Day 2
    const people = [
      { name: 'Wes', year: 1988 },
      { name: 'Kait', year: 1986 },
      { name: 'Irv', year: 1970 },
      { name: 'Lux', year: 2015 }
    ];
    const comments = [
      { text: 'Love this!', id: 523423 },
      { text: 'Super good', id: 823423 },
      { text: 'You are the best', id: 2039842 },
      { text: 'Ramen is my fav food ever', id: 123523 },
      { text: 'Nice Nice Nice!', id: 542328 }
    ];
    // Some and Every Checks
    // Array.prototype.some() // is at least one person 19 or older?
      const isAdult = people.some(person => {
        const currentYear = (new Date()).getFullYear();
        return currentYear - person.year >= 19;
      })
      console.log(isAdult);
    // Array.prototype.every() // is everyone 19 or older?
      const allAdults = people.every(person => {
        const currentYear = (new Date()).getFullYear();
        return currentYear - person.year >= 19;
      })
      console.log(allAdults);
    // Array.prototype.find()
    // Find is like filter, but instead returns just the one you are looking for
    // find the comment with the ID of 823423
      const comment = comments.find(comment => comment.id === 823423);
      console.log(comment);
    // Array.prototype.findIndex()
    // Find the comment with this ID
    // delete the comment with the ID of 823423
      const index = comments.findIndex(comment => comment.id === 823423);
      console.log(index);
      comments.splice(index, 1);
  </script>
</body>")

d8 = Draft.create!(name: "08 - Fun with HTML5 Canvas", completed: "Yes", intro:"Creation of an HMTL canvas, click to draw a line.", completion: '<body>
<canvas id="draw" width="800" height="800"></canvas>
<script>
  const canvas = document.querySelector("#draw");
  const ctx = canvas.getContext("2d");
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
  ctx.strokeStyle = "#BADA55";
  ctx.lineJoin = "round";
  ctx.lineCap = "round";
  ctx.lineWidth = 50;
  ctx.globalCompositeOperation = "overlay";

  let isDrawing = false;
  let lastX = 0;
  let lastY = 0;
  let hue = 0;
  let direction = true;

  function draw(e) {
    if (!isDrawing) return;
    console.log(e);
    ctx.strokeStyle = `hsl(${hue}, 100%, 50%)`;
    ctx.beginPath();
    ctx.moveTo(lastX, lastY);
    ctx.lineTo(e.offsetX, e.offsetY);
    ctx.stroke();
    [lastX, lastY] = [e.offsetX, e.offsetY];
    hue++;
    if(hue >= 360) {
      hue = 0;
    }
    if (ctx.lineWidth >= 75 || ctx.lineWidth <= 1) {
      direction = !direction;
    }
    if (direction) {
    ctx.lineWidth++;
    } else {
      ctx.lineWidth--;
    }
  }

  canvas.addEventListener("mousedown", (e) => {
    isDrawing = true;
    [lastX, lastY] = [e.offsetX, e.offsetY];
  });

  canvas.addEventListener("mousemove", draw);
  canvas.addEventListener("mouseup", () => isDrawing = false);
  canvas.addEventListener("mouseout", () => isDrawing = false);
</script>

<style>
  html, body {
    margin:0;
  }
</style>
</body>')

d9 = Draft.create!(name: "09 - Dev Tools Domination", completed: "No")
d10 = Draft.create!(name: "10 - Hold Shift and Check Checkboxes", completed: "No")
d11 = Draft.create!(name: "11 - Custom Video Player", completed: "No")
d12 = Draft.create!(name: "12 - Key Sequence Detection", completed: "No")
d13 = Draft.create!(name: "13 - Slide in on Scroll", completed: "No")
d14 = Draft.create!(name: "14 - JavaScript References VS Copying", completed: "No")
d15 = Draft.create!(name: "15 - LocalStorage", completed: "No")
d16 = Draft.create!(name: "16 - Mouse Move Shadow", completed: "No")
d17 = Draft.create!(name: "17 - Sort Without Articles", completed: "No")
d18 = Draft.create!(name: "18 - Adding Up Times with Reduce", completed: "No")
d19 = Draft.create!(name: "19 - Webcam Fun", completed: "No")
d20 = Draft.create!(name: "20 - Speech Detection", completed: "No")
d21 = Draft.create!(name: "21 - Geolocation", completed: "No")
d22 = Draft.create!(name: "22 - Follow Along Link Highlighter", completed: "No")
d23 = Draft.create!(name: "23 - Speech Synthesis", completed: "No")
d24 = Draft.create!(name: "24 - Sticky Nav", completed: "No")
d25 = Draft.create!(name: "25 - Event Capture, Propagation, Bubbling and Once", completed: "No")
d26 = Draft.create!(name: "26 - Stripe Follow Along Nav", completed: "No")
d27 = Draft.create!(name: "27 - Click and Drag", completed: "No")
d28 = Draft.create!(name: "28 - Video Speed Controller", completed: "No")
d29 = Draft.create!(name: "29 - Countdown Timer", completed: "No")
d30 = Draft.create!(name: "30 - Whack A Mole", completed: "No")

puts "End seed"
