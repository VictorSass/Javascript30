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

d3 = Draft.create!(name: "03 - CSS Variables", completed: "Yes", intro:"Today's exercise will be about CSS variables, move any cursor to update the CSS in real time.", completion: '<body><style>:root {
  --base: red;
  --spacing: 10px;
  --blur: 10px;
}

img {
padding: var(--spacing);
background: var(--base);
filter: blur(var(--blur));
}

input {
  width:100px;
}
</style>
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
</head>
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

d6 = Draft.create!(name: "06 - Type Ahead", completed: "Yes", intro: "Today, the goal is to create a feature that update suggestions everytime an input is made in the searchbar", completion: '<body><style>
input {
  width: 100%;
  padding:20px;
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

d7 = Draft.create!(name: "07 - Array Cardio Day 2", completed: "Yes", intro: "Today is all about array methods (again).", completion: "<body>
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

d8 = Draft.create!(name: "08 - Fun with HTML5 Canvas", completed: "Yes", intro:"For today's exercise, we created a canva. Draw something ! ", completion: '<body>
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
  canvas {
    background-color: white;
  }
</style>
</body>')

d9 = Draft.create!(name: "09 - Dev Tools Domination", completed: "Yes", intro: "Today is avout dev tools and console tricks ! Check the Javascript Console 💁 to see the result", completion: '<body>
  <p onClick="makeGreen()"><i>To see a JS interaction, you can find the attributes in the console, right click > attributes modifications</i></p>
  <script>
    const dogs = [{ name: "Snickers", age: 2 }, { name: "Bounty", age: 8 }];
    function makeGreen() {
      const p = document.querySelector("p");
      p.style.color = "#BADA55";
      p.style.fontSize = "50px";
    }

    // Regular
    console.log("Hello");

    // Interpolated
    console.log("Hello I am an %s string!", "interpolated");

    // Styled
    console.log("%c I am some big red text", "font-size:50px; background:red")

    // warning!
    console.warn("Warning sign");

    // Error :|
    console.error("Error sign");

    // Info
    console.info("Info sign");

    // Testing
    const p = document.querySelector("p");

    console.assert(p.classList.contains("ouch"), "This word is not contained");

    console.assert(1 === 2, "The assertation is wrong so this message print");

    // clearing
    console.clear();

    // Viewing DOM Elements
    console.log(p);
    console.dir(p);
    console.clear();

    // Grouping together
    dogs.forEach(dog => {
      console.groupCollapsed(`${dog.name}`);
      console.log(`This is ${dog.name}`);
      console.log(`${dog.name} is ${dog.age} years old`);
      console.log(`${dog.name} is ${dog.age * 7} dog years old`);
      console.groupEnd(`${dog.name}`);
    });

    // counting
    console.count("Snickers");
    console.count("Bounty");
    console.count("Bounty");
    console.count("Bounty");
    console.count("Snickers");
    console.count("Snickers");
    console.count("Snickers");
    console.count("Bounty");
    console.count("Bounty");
    console.count("Snickers");

    // timing
    console.time("Fetching data");
    fetch("https://api.github.com/users/VictorSass")
      .then(data => data.json())
      .then(data => {
        console.timeEnd("Fetching data");
        console.log(data);
      });
  </script>
</body>')

d10 = Draft.create!(name: "10 - Hold Shift and Check Checkboxes", completed: "Yes", intro: "Below is a form that allow you to check multiple boxes holding the shift button. Hold shift while clicking on a box to select all or click on a box, hold shit then click on another box to select the ones you want.", completion: '<body><style>
    .inbox {
      max-width:400px;
      margin:50px auto;
      background:white;
      border-radius:5px;
      box-shadow:10px 10px 0 rgba(0,0,0,0.1);
    }
    .item {
      display:flex;
      align-items:center;
      border-bottom: 1px solid #F1F1F1;
    }
    .item:last-child {
      border-bottom:0;
    }
    input:checked + p {
      background:#F9F9F9;
      text-decoration: line-through;
    }
    input[type="checkbox"] {
      margin:20px;
    }
    p {
      margin:0;
      padding:20px;
      transition:background 0.2s;
      flex:1;
      font-family:"helvetica neue";
      font-size: 20px;
      font-weight: 200;
      border-left: 1px solid #D1E2FF;
    }
  </style>

   <!--
   The following is a common layout you would see in an email client.
   When a user clicks a checkbox, holds Shift, and then clicks another checkbox a few rows down, all the checkboxes inbetween those two checkboxes should be checked.
  -->
  <div class="inbox">
    <div class="item">
      <input type="checkbox">
      <p class="paragraph">This is an inbox layout.</p>
    </div>
    <div class="item">
      <input type="checkbox">
      <p class="paragraph">Check one item</p>
    </div>
    <div class="item">
      <input type="checkbox">
      <p class="paragraph">Hold down your Shift key</p>
    </div>
    <div class="item">
      <input type="checkbox">
      <p class="paragraph">Check a lower item</p>
    </div>
    <div class="item">
      <input type="checkbox">
      <p class="paragraph">Everything inbetween should also be set to checked</p>
    </div>
    <div class="item">
      <input type="checkbox">
      <p class="paragraph">Watch the console</p>
    </div>
    <div class="item paragraph">
      <input type="checkbox">
      <p">To see the the JS at work</p>
    </div>
    <div class="item paragraph">
      <input type="checkbox">
      <p>Or go to the next exercise</p>
    </div>
  </div>

<script>
  const checkboxes = document.querySelectorAll(".inbox [type=\"checkbox\"\]");
  console.log(checkboxes);

  let lastChecked;

  function handleCheck(e) {
    let inBetween = false;
    if(e.shiftKey && this.checked) {
      checkboxes.forEach(checkbox => {
        if(checkbox === this || checkbox === lastChecked) {
          inBetween = !inBetween;
        }
        if(inBetween) {
          checkbox.checked = true;
        }
      });
    }
    lastChecked = this;
  }

  checkboxes.forEach(checkbox => checkbox.addEventListener("click", handleCheck))
</script>')

d11 = Draft.create!(name: "11 - Custom Video Player", completed: "Yes", intro: "We are customizing the HTML default player.", completion: '<body>
   <div class="player">
     <video class="player__video viewer" src="https://player.vimeo.com/external/194837908.sd.mp4?s=c350076905b78c67f74d7ee39fdb4fef01d12420&profile_id=164"></video>

     <div class="player__controls">
       <div class="progress">
        <div class="progress__filled"></div>
       </div>
       <button class="player__button toggle" title="Toggle Play">►</button>
       <input type="range" name="volume" class="player__slider" min="0" max="1" step="0.05" value="1">
       <input type="range" name="playbackRate" class="player__slider" min="0.5" max="2" step="0.1" value="1">
       <button data-skip="-10" class="player__button">« 10s</button>
       <button data-skip="25" class="player__button">25s »</button>
     </div>
   </div>

  <script src="videoplayer.js"></script>
</body>')

d12 = Draft.create!(name: "12 - Key Sequence Detection", completed: "Yes", intro: "Today is about key sequencing detection, meaning an action will perform if it matches what we want. Try it by typing 'javascript' in this page !", completion: '<head>
  <meta charset="UTF-8">
  <script type="text/javascript" src="http://www.cornify.com/js/cornify.js"></script>
</head>
<body>
<script>
  const pressed = [];
  const secretCode = "javascript";
  window.addEventListener("keyup", (e) => {
    console.log(e.key);
    pressed.push(e.key);
    pressed.splice(-secretCode.length - 1, pressed.length - secretCode.length);
    if(pressed.join("").includes(secretCode)) {
      console.warn("Congratulations ! You typed the code correctly.");
      cornify_add();
    }
    console.log(pressed);
    });
</script>
</body>')

d13 = Draft.create!(name: "13 - Slide in on Scroll", completed: "Yes", intro: "Today, we are adding sliding images that appears while we scroll at their level.", completion: '<body>
  <div class="site-wrap">

    <h1>Slide in on Scroll</h1>

    <p>Consectetur adipisicing elit. Tempore tempora rerum, est autem cupiditate, corporis a qui libero ipsum delectus quidem dolor at nulla, adipisci veniam in reiciendis aut asperiores omnis blanditiis quod quas laborum nam! Fuga ad tempora in aspernatur pariaturlores sunt esse magni, ut, dignissimos.</p>
    <p>Lorem ipsum cupiditate, corporis a qui libero ipsum delectus quidem dolor at nulla, adipisci veniam in reiciendis aut asperiores omnis blanditiis quod quas laborum nam! Fuga ad tempora in aspernatur pariatur fugit quibusdam dolores sunt esse magni, ut, dignissimos.</p>
    <p>Adipisicing elit. Tempore tempora rerum..</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore tempora rerum, est autem cupiditate, corporis a qui libero ipsum delectus quidem dolor at nulla, adipisci veniam in reiciendis aut asperiores omnis blanditiis quod quas laborum nam! Fuga ad tempora in aspernatur pariatur fugit quibusdam dolores sunt esse magni, ut, dignissimos.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore tempora rerum, est autem cupiditate, corporis a qui libero ipsum delectus quidem dolor at nulla, adipisci veniam in reiciendis aut asperiores omnis blanditiis quod quas laborum nam! Fuga ad tempora in aspernatur pariatur fugit quibusdam dolores sunt esse magni, ut, dignissimos.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore tempora rerum, est autem cupiditate, corporis a qui libero ipsum delectus quidem dolor at nulla, adipisci veniam in reiciendis aut asperiores omnis blanditiis quod quas laborum nam! Fuga ad tempora in aspernatur pariatur fugit quibusdam dolores sunt esse magni, ut, dignissimos.</p>

    <img src="http://unsplash.it/400/400" class="align-left slide-in">

    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates, deserunt facilis et iste corrupti omnis tenetur est. Iste ut est dicta dolor itaque adipisci, dolorum minima, veritatis earum provident error molestias. Ratione magni illo sint vel velit ut excepturi consectetur suscipit, earum modi accusamus voluptatem nostrum, praesentium numquam, reiciendis voluptas sit id quisquam. Consequatur in quis reprehenderit modi perspiciatis necessitatibus saepe, quidem, suscipit iure natus dignissimos ipsam, eligendi deleniti accusantium, rerum quibusdam fugit perferendis et optio recusandae sed ratione. Culpa, dolorum reprehenderit harum ab voluptas fuga, nisi eligendi natus maiores illum quas quos et aperiam aut doloremque optio maxime fugiat doloribus. Eum dolorum expedita quam, nesciunt</p>

    <img src="http://unsplash.it/400/401" class="align-right slide-in">

    <p> at provident praesentium atque quas rerum optio dignissimos repudiandae ullam illum quibusdam. Vel ad error quibusdam, illo ex totam placeat. Quos excepturi fuga, molestiae ea quisquam minus, ratione dicta consectetur officia omnis, doloribus voluptatibus? Veniam ipsum veritatis architecto, provident quas consequatur doloremque quam quidem earum expedita, ad delectus voluptatum, omnis praesentium nostrum qui aspernatur ea eaque adipisci et cumque ab? Ea voluptatum dolore itaque odio. Eius minima distinctio harum, officia ab nihil exercitationem. Tempora rem nemo nam temporibus molestias facilis minus ipsam quam doloribus consequatur debitis nesciunt tempore officiis aperiam quisquam, molestiae voluptates cum, fuga culpa. Distinctio accusamus quibusdam, tempore perspiciatis dolorum optio facere consequatur quidem ullam beatae architecto, ipsam sequi officiis dignissimos amet impedit natus necessitatibus tenetur repellendus dolor rem! Dicta dolorem, iure, facilis illo ex nihil ipsa amet officia, optio temporibus eum autem odit repellendus nisi. Possimus modi, corrupti error debitis doloribus dicta libero earum, sequi porro ut excepturi nostrum ea voluptatem nihil culpa? Ullam expedita eligendi obcaecati reiciendis velit provident omnis quas qui in corrupti est dolore facere ad hic, animi soluta assumenda consequuntur reprehenderit! Voluptate dolor nihil veniam laborum voluptas nisi pariatur sed optio accusantium quam consectetur, corrupti, sequi et consequuntur, excepturi doloremque. Tempore quis velit corporis neque fugit non sequi eaque rem hic. Facere, inventore, aspernatur. Accusantium modi atque, asperiores qui nobis soluta cumque suscipit excepturi possimus doloremque odit saepe perferendis temporibus molestiae nostrum voluptatum quis id sint quidem nesciunt culpa. Rerum labore dolor beatae blanditiis praesentium explicabo velit optio esse aperiam similique, voluptatem cum, maiores ipsa tempore. Reiciendis sed culpa atque inventore, nam ullam enim expedita consectetur id velit iusto alias vitae explicabo nemo neque odio reprehenderit soluta sint eaque. Aperiam, qui ut tenetur, voluptate doloremque officiis dicta quaerat voluptatem rerum natus magni. Eum amet autem dolor ullam.</p>

    <img src="http://unsplash.it/200/500" class="align-left slide-in">

    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio maiores adipisci quibusdam repudiandae dolor vero placeat esse sit! Quibusdam saepe aperiam explicabo placeat optio, consequuntur nihil voluptatibus expedita quia vero perferendis, deserunt et incidunt eveniet <img src="http://unsplash.it/200/200" class="align-right slide-in"> temporibus doloremque possimus facilis. Possimus labore, officia dolore! Eaque ratione saepe, alias harum laboriosam deserunt laudantium blanditiis eum explicabo placeat reiciendis labore iste sint. Consectetur expedita dignissimos, non quos distinctio, eos rerum facilis eligendi. Asperiores laudantium, rerum ratione consequatur, culpa consectetur possimus atque ab tempore illum non dolor nesciunt. Neque, rerum. A vel non incidunt, quod doloremque dignissimos necessitatibus aliquid laboriosam architecto at cupiditate commodi expedita in, quae blanditiis. Deserunt labore sequi, repellat laboriosam est, doloremque culpa reiciendis tempore excepturi. Enim nostrum fugit itaque vel corporis ullam sed tenetur ipsa qui rem quam error sint, libero. Laboriosam rem, ratione. Autem blanditiis</p>


    <p>laborum neque repudiandae quam, cumque, voluptate veritatis itaque, placeat veniam ad nisi. Expedita, laborum reprehenderit ratione soluta velit natus, odit mollitia. Corporis rerum minima fugiat in nostrum. Assumenda natus cupiditate hic quidem ex, quas, amet ipsum esse dolore facilis beatae maxime qui inventore, iste? Maiores dignissimos dolore culpa debitis voluptatem harum, excepturi enim reiciendis, tempora ab ipsam illum aspernatur quasi qui porro saepe iure sunt eligendi tenetur quaerat ducimus quas sequi omnis aperiam suscipit! Molestiae obcaecati officiis quo, ratione eveniet, provident pariatur. Veniam quasi expedita distinctio, itaque molestiae sequi, dolorum nisi repellendus quia facilis iusto dignissimos nam? Tenetur fugit quos autem nihil, perspiciatis expedita enim tempore, alias ab maiores quis necessitatibus distinctio molestias eum, quidem. Delectus impedit quidem laborum, fugit vel neque quo, ipsam, quasi aspernatur quas odio nihil? Veniam amet reiciendis blanditiis quis reprehenderit repudiandae neque, ab ducimus, odit excepturi voluptate saepe ipsam. Voluptatem eum error voluptas porro officiis, amet! Molestias, fugit, ut! Tempore non magnam, amet, facere ducimus accusantium eos veritatis neque.</p>

    <img src="http://unsplash.it/400/400" class="align-right slide-in">

    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio maiores adipisci quibusdam repudiandae dolor vero placeat esse sit! Quibusdam saepe aperiam explicabo placeat optio, consequuntur nihil voluptatibus expedita quia vero perferendis, deserunt et incidunt eveniet temporibus doloremque possimus facilis. Possimus labore, officia dolore! Eaque ratione saepe, alias harum laboriosam deserunt laudantium blanditiis eum explicabo placeat reiciendis labore iste sint. Consectetur expedita dignissimos, non quos distinctio, eos rerum facilis eligendi. Asperiores laudantium, rerum ratione consequatur, culpa consectetur possimus atque ab tempore illum non dolor nesciunt. Neque, rerum. A vel non incidunt, quod doloremque dignissimos necessitatibus aliquid laboriosam architecto at cupiditate commodi expedita in, quae blanditiis. Deserunt labore sequi, repellat laboriosam est, doloremque culpa reiciendis tempore excepturi. Enim nostrum fugit itaque vel corporis ullam sed tenetur ipsa qui rem quam error sint, libero. Laboriosam rem, ratione. Autem blanditiis laborum neque repudiandae quam, cumque, voluptate veritatis itaque, placeat veniam ad nisi. Expedita, laborum reprehenderit ratione soluta velit natus, odit mollitia. Corporis rerum minima fugiat in nostrum. Assumenda natus cupiditate hic quidem ex, quas, amet ipsum esse dolore facilis beatae maxime qui inventore, iste? Maiores dignissimos dolore culpa debitis voluptatem harum, excepturi enim reiciendis, tempora ab ipsam illum aspernatur quasi qui porro saepe iure sunt eligendi tenetur quaerat ducimus quas sequi omnis aperiam suscipit! Molestiae obcaecati officiis quo, ratione eveniet, provident pariatur. Veniam quasi expedita distinctio, itaque molestiae sequi, dolorum nisi repellendus quia facilis iusto dignissimos nam? Tenetur fugit quos autem nihil, perspiciatis expedita enim tempore, alias ab maiores quis necessitatibus distinctio molestias eum, quidem. Delectus impedit quidem laborum, fugit vel neque quo, ipsam, quasi aspernatur quas odio nihil? Veniam amet reiciendis blanditiis quis reprehenderit repudiandae neque, ab ducimus, odit excepturi voluptate saepe ipsam. Voluptatem eum error voluptas porro officiis, amet! Molestias, fugit, ut! Tempore non magnam, amet, facere ducimus accusantium eos veritatis neque.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio maiores adipisci quibusdam repudiandae dolor vero placeat esse sit! Quibusdam saepe aperiam explicabo placeat optio, consequuntur nihil voluptatibus expedita quia vero perferendis, deserunt et incidunt eveniet temporibus doloremque possimus facilis. Possimus labore, officia dolore! Eaque ratione saepe, alias harum laboriosam deserunt laudantium blanditiis eum explicabo placeat reiciendis labore iste sint. Consectetur expedita dignissimos, non quos distinctio, eos rerum facilis eligendi. Asperiores laudantium, rerum ratione consequatur, culpa consectetur possimus atque ab tempore illum non dolor nesciunt. Neque, rerum. A vel non incidunt, quod doloremque dignissimos necessitatibus aliquid laboriosam architecto at cupiditate commodi expedita in, quae blanditiis. Deserunt labore sequi, repellat laboriosam est, doloremque culpa reiciendis tempore excepturi. Enim nostrum fugit itaque vel corporis ullam sed tenetur ipsa qui rem quam error sint, libero. Laboriosam rem, ratione. Autem blanditiis laborum neque repudiandae quam, cumque, voluptate veritatis itaque, placeat veniam ad nisi. Expedita, laborum reprehenderit ratione soluta velit natus, odit mollitia. Corporis rerum minima fugiat in nostrum. Assumenda natus cupiditate hic quidem ex, quas, amet ipsum esse dolore facilis beatae maxime qui inventore, iste? Maiores dignissimos dolore culpa debitis voluptatem harum, excepturi enim reiciendis, tempora ab ipsam illum aspernatur quasi qui porro saepe iure sunt eligendi tenetur quaerat ducimus quas sequi omnis aperiam suscipit! Molestiae obcaecati officiis quo, ratione eveniet, provident pariatur. Veniam quasi expedita distinctio, itaque molestiae sequi, dolorum nisi repellendus quia facilis iusto dignissimos nam? Tenetur fugit quos autem nihil, perspiciatis expedita enim tempore, alias ab maiores quis necessitatibus distinctio molestias eum, quidem. Delectus impedit quidem laborum, fugit vel neque quo, ipsam, quasi aspernatur quas odio nihil? Veniam amet reiciendis blanditiis quis reprehenderit repudiandae neque, ab ducimus, odit excepturi voluptate saepe ipsam. Voluptatem eum error voluptas porro officiis, amet! Molestias, fugit, ut! Tempore non magnam, amet, facere ducimus accusantium eos veritatis neque.</p>
  </div>

  <script>
    function debounce(func, wait = 20, immediate = true) {
      var timeout;
      return function() {
        var context = this, args = arguments;
        var later = function() {
          timeout = null;
          if (!immediate) func.apply(context, args);
        };
        var callNow = immediate && !timeout;
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
        if (callNow) func.apply(context, args);
      };
    }

    const sliderImages = document.querySelectorAll(".slide-in");

    function checkSlide(e) {
      sliderImages.forEach(sliderImage => {
        const slideInAt = (window.scrollY + window.innerHeight) - sliderImage.height / 2;
        const imageBottom = sliderImage.offsetTop + sliderImage.height;
        const isHalfShown = slideInAt > sliderImage.offsetTop;
        const isNotScrolledPast = window.scrollY < imageBottom;
        if(isHalfShown && isNotScrolledPast) {
          sliderImage.classList.add("active");
        } else {
          sliderImage.classList.remove("active");
        }
      });
    }

    window.addEventListener("scroll", debounce(checkSlide));

  </script>
</body>')
d14 = Draft.create!(name: "14 - JavaScript References VS Copying", completed: "Yes", intro: "Today is about understanding the subtles differences between referencing and copying in JS, check the Javascript Console 💁 to see the result.", completion: '<body>
  <script>
    // start with strings, numbers and booleans
    let age = 100;
    let age2 = age;
    console.log(age, age2);
    age = 200;
    console.log(age, age2);

    let name = "Sassonia";
    let name2 = name;
    console.log(name, name2);
    name = "Victor";
    console.log(name, name2);

    // Let`s say we have an array
    const players = ["Wes", "Sarah", "Ryan", "Poppy"];

    // and we want to make a copy of it.
    const team = players;
    console.log(players, team);

    // You might think we can just do something like this:
    team[3] = "Daniel";

    // however what happens when we update that array?
    // now here is the problem!
    // oh no - we have edited the original array too!
    // Why? It`s because that is an array reference, not an array copy. They both point to the same array!
    // So, how do we fix this? We take a copy instead!
    // one way
    const team2 = players.slice();

    // or create a new array and concat the old one in
    const team3 = [].concat(players);

    // or use the new ES6 Spread
    const team4 = [...players];
    team4[3] = "Test";
    console.log(team4);

    const team5 = Array.from(players);
    team5[3] = "Test";
    console.log(team5);

    // now when we update it, the original one isn`t changed
    // The same thing goes for objects, let`s say we have a person object
    // with Objects
    const person = {
      name: "Wes Bos",
      age: 80
    };

    // and think we make a copy:
    // const captain = person;
    // captain.newvariable = 1;

    // how do we take a copy instead?
    const captain2 = Object.assign({}, person, { newvariable: 1 });
    console.log(captain2);

    // We will hopefully soon see the object ...spread
    // const captain3 = {...person};

    // Things to note - this is only 1 level deep - both for Arrays and Objects. lodash has a cloneDeep method, but you should think twice before using it.
    const Victor = {
      name: "Victor",
      age: 26,
      social: {
        Twitter: "@VictorSassonia",
        Githhub: "@VictorSass"
      }
    }

    console.log(Victor);

    const Victor2 = Object.assign({}, Victor); //Object assign is only 1 level deep !

    const Victor3 = JSON.parse(JSON.stringify(Victor));
  </script>
</body>')

d15 = Draft.create!(name: "15 - LocalStorage", completed: "Yes", intro: "Today we learn to keep informations on the webpage even after refreshing it. In this example, you can add or check anything in the form below and it will be saved locally.", completion: '<body>
  <style>
    svg {
      fill:white;
      background: rgba(0,0,0,0.1);
      padding: 20px;
      border-radius: 50%;
      width:200px;
      margin-bottom: 25px;
    }
  </style>

    <div class="image-fish text-center">
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve"><g><path d="M495.9,425.3H16.1c-5.2,0-10.1,2.9-12.5,7.6c-2.4,4.7-2.1,10.3,0.9,14.6l39,56.4c2.6,3.8,7,6.1,11.6,6.1h401.7   c4.6,0,9-2.3,11.6-6.1l39-56.4c3-4.3,3.3-9.9,0.9-14.6C506,428.2,501.1,425.3,495.9,425.3z M449.4,481.8H62.6L43,453.6H469   L449.4,481.8z"/><path d="M158.3,122c7.8,0,14.1-6.3,14.1-14.1V43.4c0-7.8-6.3-14.1-14.1-14.1c-7.8,0-14.1,6.3-14.1,14.1v64.5   C144.2,115.7,150.5,122,158.3,122z"/><path d="M245.1,94.7c7.8,0,14.1-6.3,14.1-14.1V16.1c0-7.8-6.3-14.1-14.1-14.1C237.3,2,231,8.3,231,16.1v64.5   C231,88.4,237.3,94.7,245.1,94.7z"/><path d="M331.9,122c7.8,0,14.1-6.3,14.1-14.1V43.4c0-7.8-6.3-14.1-14.1-14.1s-14.1,6.3-14.1,14.1v64.5   C317.8,115.7,324.1,122,331.9,122z"/><path d="M9.6,385.2c5.3,2.8,11.8,1.9,16.2-2.2l50.6-47.7c56.7,46.5,126.6,71.9,198.3,71.9c0,0,0,0,0,0   c87.5,0,169.7-36.6,231.4-103.2c5-5.4,5-13.8,0-19.2c-61.8-66.5-144-103.2-231.4-103.2c-72,0-142.2,25.6-199,72.5l-50-47.1   c-4.4-4.1-10.9-5-16.2-2.2c-5.3,2.8-8.3,8.7-7.4,14.6l11.6,75L2.2,370.6C1.3,376.5,4.2,382.4,9.6,385.2z M380.9,230.8   c34.9,14.3,67.2,35.7,95.3,63.6c-10.1,10-20.8,19.2-31.9,27.5c-22.4-3.3-29.6-8.8-30.7-9.7c-4-5.7-11.8-7.7-18.1-4.4   c-6.9,3.6-9.5,12.2-5.9,19.1c1.9,3.5,7.3,10.3,22.4,16c-10.1,5.7-20.5,10.7-31.1,15.1C352.4,320.2,352.4,268.6,380.9,230.8z    M36.3,255.6l29.4,27.7c5.3,5,13.6,5.1,19.1,0.3c53.2-47.6,120.7-73.7,190-73.7c26.9,0,53.2,3.9,78.5,11.3   c-29.3,44.6-29.3,102,0,146.6c-25.3,7.4-51.6,11.3-78.5,11.3c-69,0-136.3-26-189.4-73.2c-2.7-2.4-13.4-6.3-19.1,0.3l-30.1,28.3   l5.7-40C42.2,293,36.3,255.6,36.3,255.6z"/><circle cx="398.8" cy="273.8" r="14.1"/></g></svg>
    </div>

    <div class="wrapper-exo15">
      <h2 class="text-center">LOCAL TAPAS</h2>
      <p></p>
      <ul class="plates">
        <li>Loading Tapas...</li>
      </ul>
      <form class="add-items text-center">
        <input type="text" name="item" placeholder="Item Name" required>
        <input type="submit" value="+ Add Item">
      </form>
    </div>

    <script>
      const addItems = document.querySelector(".add-items");
      const itemsList = document.querySelector(".plates");
      const items = JSON.parse(localStorage.getItem("items")) || [];

      function addItem(e) {
        e.preventDefault();
        const text = (this.querySelector("[name=item]")).value;
        const item = {
          text,
          done: false
        }
        items.push(item);
        populateList(items, itemsList);
        localStorage.setItem("items", JSON.stringify(items));
        this.reset();
      }

      function populateList(plates = [], platesList) {
        platesList.innerHTML = plates.map((plate, i) => {
          return `
            <li>
              <input type="checkbox" data-index=${i} id="item${i}" ${plate.done ? "checked" : "" } />
              <label for="item${i}">${plate.text}</label>
            </li>
          `;
        }).join("");
      }

      function toggleDone(e) {
        if (!e.target.matches("input")) return;
        const el = e.target;
        const index = el.dataset.index;
        items[index].done = !items[index].done;
        localStorage.setItem("items", JSON.stringify(items));
        populateList(items, itemsList);
      }

      addItems.addEventListener("submit", addItem);
      itemsList.addEventListener("click", toggleDone);
      populateList(items, itemsList);

    </script>
  </body>')

d16 = Draft.create!(name: "16 - Mouse Move Shadow", completed: "Yes", intro: "This exercise is about mouse movement, move the mouse around to see the result !", completion: '<body>
  <div class="hero">
    <h1 class="hero-shadow" contenteditable>🔥WOAH!</h1>
  </div>
<script>
  const hero = document.querySelector(".hero");
  const text = hero.querySelector("h1");
  const walk = 150;

  function shadow(e) {
    const width = hero.offsetWidth;
    const height = hero.offsetHeight;
    let { offsetX: x, offsetY: y } = e;
    if (this !== e.target) {
      x = x + e.target.offsetLeft;
      y = y + e.target.offsetTop;
    }
    const xWalk = Math.round((x / width * walk) - (walk / 2));
    const yWalk = Math.round((y / height * walk) - (walk / 2));
    text.style.textShadow = `
      ${xWalk}px ${yWalk}px 0 rgba(255,0,255,0.7),
      ${xWalk * -1}px ${yWalk}px 0 rgba(0,255,255,0.7),
      ${yWalk}px ${xWalk * -1}px 0 rgba(0,255,0,0.7),
      ${yWalk * -1}px ${xWalk}px 0 rgba(0,0,255,0.7)
    `;
  }
  hero.addEventListener("mousemove", shadow);
</script>
</body>')

d17 = Draft.create!(name: "17 - Sort Without Articles", completed: "Yes", intro: "Today we use the sort method of JavaScript to sort the bands below irrespective of articles.", completion: '<body>
  <ul id="bands"></ul>
<script>
const bands = ["The Plot in You", "The Devil Wears Prada", "Pierce the Veil", "Norma Jean", "The Bled", "Say Anything", "The Midway State", "We Came as Romans", "Counterparts", "Oh, Sleeper", "A Skylit Drive", "Anywhere But Here", "An Old Dog"];

function strip(bandName) {
  return bandName.replace(/^(a |the |an )/i, "").trim();
}

const sortedBands = bands.sort((a, b) => strip(a) > strip(b) ? 1 : -1);
document.querySelector("#bands").innerHTML = sortedBands.map(band => `<li>${band}</li>`).join("");

console.log(sortedBands);
</script>

</body>')

d18 = Draft.create!(name: "18 - Adding Up Times with Reduce", completed: "Yes", intro: "Today we add up the length of each video to find the total length. Each video length can be found in every 'data-time' attributes in the HTML. Open the console to see the result !", completion: '<body>
  <ul class="videos">
    <li data-time="5:43">
      Video 1
    </li>
    <li data-time="2:33">
      Video 2
    </li>
    <li data-time="3:45">
      Video 3
    </li>
    <li data-time="0:47">
      Video 4
    </li>
    <li data-time="5:21">
      Video 5
    </li>
    <li data-time="6:56">
      Video 6
    </li>
    <li data-time="3:46">
      Video 7
    </li>
  </ul>

<script>
  const timeNodes = Array.from(document.querySelectorAll("[data-time]"));
  const seconds = timeNodes
    .map(node => node.dataset.time)
    .map(timeCode => {
      const [mins, secs] = timeCode.split(":").map(parseFloat);
      return (mins * 60) + secs;
      console.log(mins, secs);
    })
    .reduce((total, vidSeconds) => total + vidSeconds);

    let secondsLeft = seconds;
    const hours = Math.floor(secondsLeft / 3600);
    secondsLeft = secondsLeft % 3600;
    const mins = Math.floor(secondsLeft / 60);
    secondsLeft = secondsLeft % 60;
    console.log(`The total length of the videos are ${hours} hours, ${mins} minutes and ${secondsLeft} seconds`);
</script>

</body>')

d19 = Draft.create!(name: "19 - Webcam Fun", completed: "No")

d20 = Draft.create!(name: "20 - Speech Detection", completed: "Yes", intro: "Today is about in-browser speech recognition, try to talk on your microphone to see what happen. !¡ WORKS ONLY WITH FIREFOX/CHROME LAST VERSIONS !¡", completion: '<body>
  <style>
    p {
      margin: 0 0 3rem;
    }
  </style>

  <div class="words" contenteditable>
  </div>

<script>
  window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

  const recognition = new SpeechRecognition();
  recognition.interimResults = true;

  let p = document.createElement("p");
  const words = document.querySelector(".words");
  words.appendChild(p);

  recognition.addEventListener("result", e => {
    console.log(e.results);
    const transcript = Array.from(e.results)
      .map(result => result[0])
      .map(result => result.transcript)
      .join("");

      p.textContent = transcript;
      if (e.results[0].isFinal) {
        p = document.createElement("p");
        words.appendChild(p);
      }

    console.log(transcript);
  });
  recognition.addEventListener("end", recognition.start);
  recognition.start();
</script>
</body>')

d21 = Draft.create!(name: "21 - Geolocation", completed: "Yes", intro: "This tool is able to display the directions and your travelling speed.", completion: '<body>
  <div class="text-center">
    <svg class="arrow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 64 64" enable-background="new 0 0 64 64" xml:space="preserve"><g><path fill="#ffffff" d="M32,1.824C15.361,1.824,1.825,15.361,1.825,32c0,16.639,13.537,30.176,30.175,30.176   S62.175,48.639,62.175,32C62.175,15.361,48.639,1.824,32,1.824z M29.715,3.988h1.12l2.333,3.807V3.988h1.069v5.701h-1.155   l-2.298-3.718v3.718h-1.069V3.988z M9.323,33.917H8.102l-1.136-4.262l-1.132,4.262H4.587l-1.361-5.701h1.178l0.859,3.916   l1.042-3.916h1.369l0.999,3.982l0.875-3.982h1.159L9.323,33.917z M33.995,59.828c-0.181,0.285-0.438,0.497-0.77,0.636   c-0.332,0.139-0.745,0.208-1.241,0.208c-0.721,0-1.274-0.167-1.661-0.5c-0.386-0.333-0.617-0.819-0.692-1.456l1.12-0.109   c0.067,0.376,0.204,0.652,0.41,0.828c0.206,0.176,0.484,0.264,0.834,0.264c0.371,0,0.65-0.078,0.838-0.235   c0.188-0.157,0.282-0.34,0.282-0.55c0-0.135-0.04-0.25-0.119-0.344c-0.079-0.095-0.217-0.177-0.414-0.247   c-0.135-0.047-0.442-0.13-0.922-0.249c-0.617-0.153-1.05-0.341-1.299-0.564c-0.35-0.314-0.525-0.696-0.525-1.147   c0-0.29,0.082-0.562,0.247-0.815c0.165-0.253,0.402-0.445,0.712-0.577c0.31-0.132,0.684-0.198,1.122-0.198   c0.716,0,1.254,0.157,1.616,0.471c0.362,0.314,0.552,0.733,0.57,1.256l-1.151,0.051c-0.049-0.293-0.155-0.504-0.317-0.632   c-0.162-0.128-0.405-0.193-0.729-0.193c-0.334,0-0.596,0.069-0.786,0.206c-0.122,0.088-0.183,0.206-0.183,0.354   c0,0.135,0.057,0.25,0.171,0.346c0.145,0.122,0.498,0.249,1.058,0.381c0.56,0.132,0.974,0.269,1.243,0.41   c0.268,0.141,0.478,0.334,0.63,0.58c0.152,0.245,0.227,0.548,0.227,0.908C34.267,59.237,34.176,59.543,33.995,59.828z M32,52.795   c-11.466,0-20.795-9.329-20.795-20.795c0-11.466,9.329-20.795,20.795-20.795S52.795,20.534,52.795,32   C52.795,43.466,43.466,52.795,32,52.795z M55.014,33.917v-5.701h4.227v0.965h-3.076v1.264h2.862v0.96h-2.862v1.552h3.185v0.961   H55.014z"/><g><path fill="#000000" d="M48.904,31.863c-4.074-1.358-8.148-2.717-12.226-4.066c-0.265-0.087-0.399-0.223-0.486-0.486    c-1.349-4.077-2.708-8.151-4.066-12.226c-0.029-0.087-0.074-0.169-0.132-0.3c-0.054,0.152-0.09,0.245-0.122,0.34    c-1.352,4.053-2.707,8.104-4.048,12.161c-0.096,0.292-0.246,0.428-0.532,0.522c-4.056,1.342-8.108,2.696-12.16,4.049    c-0.097,0.032-0.189,0.074-0.344,0.137c0.172,0.06,0.267,0.093,0.362,0.125c4.074,1.358,8.148,2.717,12.224,4.072    c0.204,0.068,0.337,0.158,0.412,0.386c1.243,3.757,2.498,7.511,3.75,11.265c0.144,0.432,0.291,0.862,0.463,1.373    c0.068-0.185,0.108-0.285,0.142-0.386c1.349-4.042,2.701-8.083,4.04-12.128c0.094-0.284,0.231-0.438,0.523-0.534    c4.056-1.341,8.108-2.696,12.161-4.048c0.099-0.033,0.195-0.076,0.347-0.137C49.067,31.925,48.987,31.891,48.904,31.863z     M37.475,32.038c-1.316,0.439-2.631,0.879-3.947,1.314c-0.095,0.031-0.139,0.081-0.17,0.173c-0.434,1.313-0.873,2.625-1.311,3.937    c-0.012,0.033-0.024,0.066-0.046,0.126c-0.056-0.166-0.104-0.306-0.15-0.446c-0.407-1.219-0.814-2.437-1.218-3.657    c-0.025-0.074-0.068-0.104-0.134-0.125c-1.323-0.44-2.646-0.881-3.968-1.322c-0.031-0.01-0.062-0.022-0.118-0.041    c0.05-0.02,0.081-0.034,0.112-0.045c1.315-0.439,2.631-0.879,3.947-1.314c0.093-0.03,0.142-0.075,0.173-0.17    c0.435-1.316,0.875-2.632,1.314-3.947c0.01-0.031,0.022-0.062,0.039-0.11c0.019,0.042,0.033,0.069,0.043,0.097    c0.441,1.323,0.882,2.645,1.321,3.969c0.028,0.085,0.072,0.129,0.158,0.158c1.324,0.438,2.646,0.879,3.969,1.32    c0.027,0.009,0.053,0.02,0.1,0.038C37.538,32.013,37.507,32.027,37.475,32.038z"/><path fill="#000000" d="M24.436,27.633c-1.069-2.137-2.119-4.237-3.216-6.43c2.189,1.094,4.292,2.145,6.433,3.216    c-0.359,0.713-0.706,1.404-1.057,2.091c-0.023,0.045-0.078,0.082-0.127,0.106C25.807,26.949,25.143,27.28,24.436,27.633z"/><path fill="#000000" d="M39.573,27.632c-0.696-0.348-1.351-0.673-2.002-1.005c-0.076-0.038-0.155-0.104-0.193-0.177    c-0.338-0.661-0.666-1.326-1.019-2.033c2.121-1.061,4.228-2.115,6.43-3.217C41.69,23.399,40.635,25.509,39.573,27.632z"/><path fill="#000000" d="M24.436,36.339c0.712,0.357,1.394,0.698,2.074,1.043c0.046,0.024,0.088,0.073,0.113,0.121    c0.339,0.671,0.674,1.345,1.028,2.051c-2.126,1.063-4.232,2.117-6.43,3.216C22.317,40.577,23.37,38.472,24.436,36.339z"/><path fill="#000000" d="M36.358,39.555c0.354-0.707,0.688-1.38,1.028-2.05c0.028-0.056,0.084-0.111,0.14-0.139    c0.67-0.339,1.343-0.674,2.047-1.026c1.066,2.131,2.118,4.235,3.215,6.43C40.601,41.676,38.503,40.628,36.358,39.555z"/></g></g></svg>

    <h1 class="speed">
      <span class="speed-value">0</span>
      <span class="units">KM/H</span>
    </h1>
  </div>

  <style>
    html {
      font-size: 100px;
    }
    h1 {
      color:black;
      font-weight: 100;
      font-size: 60px;
    }
  </style>

  <script>
    const arrow = document.querySelector(".arrow");
    const speed = document.querySelector(".speed-value");
    navigator.geolocation.watchPosition((data) => {
      console.log(data);
      speed.textContent = data.coords.speed;
      arrow.style.transform = `rotate(${data.coords.heading}deg)`;
    }, (err) => {
      console.error(err);
    });
  </script>
</body>')

d22 = Draft.create!(name: "22 - Follow Along Link Highlighter", completed: "Yes", intro: "In this one, when you move your cursion on black-link words it will trigger an highlight around them that adjust to their dimensions.",  completion: '<body>
    <nav style="clear:both">
      <ul class="menu-highlight">
        <li><a class="black-link" href="">Home</a></li>
        <li><a class="black-link" href="">Order Status</a></li>
        <li><a class="black-link" href="">Tweets</a></li>
        <li><a class="black-link" href="">Read Our History</a></li>
        <li><a class="black-link" href="">Contact Us</a></li>
      </ul>
    </nav>

    <div class="wrapper-highlighter text-justify">
      <p>Lorem ipsum dolor sit amet, <a class="black-link" href="">consectetur</a> adipisicing elit. Est <a class="black-link" href="">explicabo</a> unde natus necessitatibus esse obcaecati distinctio, aut itaque, qui vitae!</p>
      <p>Aspernatur sapiente quae sint <a class="black-link" href="">soluta</a> modi, atque praesentium laborum pariatur earum <a class="black-link" href="">quaerat</a> cupiditate consequuntur facilis ullam dignissimos, aperiam quam veniam.</p>
      <p>Cum ipsam quod, incidunt sit ex <a class="black-link" href="">tempore</a> placeat maxime <a class="black-link" href="">corrupti</a> possimus <a class="black-link" href="">veritatis</a> ipsum fugit recusandae est doloremque? Hic, <a class="black-link" href="">quibusdam</a>, nulla.</p>
      <p>Esse quibusdam, ad, ducimus cupiditate <a class="black-link" href="">nulla</a>, quae magni odit <a class="black-link" href="">totam</a> ut consequatur eveniet sunt quam provident sapiente dicta neque quod.</p>
      <p>Aliquam <a class="black-link" href="">dicta</a> sequi culpa fugiat <a class="black-link" href="">consequuntur</a> pariatur optio ad minima, maxime <a class="black-link" href="">odio</a>, distinctio magni impedit tempore enim repellendus <a class="black-link" "href="">repudiandae</a> quas!</p>
    </div>

  <script>
    const triggers = document.querySelectorAll("a");
    const highlight = document.createElement("span");
    highlight.classList.add("highlighter");
    document.body.append(highlight);

    function highlightLink() {
      const linkCoords = this.getBoundingClientRect();
      console.log(linkCoords);
      const coords = {
        width: linkCoords.width,
        height: linkCoords.height,
        top: linkCoords.top + window.scrollY,
        left: linkCoords.left + window.scrollX
      }


      highlight.style.width = `${coords.width}px`;
      highlight.style.height = `${coords.height}px`;
      highlight.style.transform = `translate(${coords.left}px, ${coords.top}px)`;
    }

    triggers.forEach(a => a.addEventListener("mouseenter", highlightLink));
  </script>
</body>')

d23 = Draft.create!(name: "23 - Speech Synthesis", completed: "Yes", intro: "This tool use the speech synthesis API that come in most browser. Enter a sentence, press \"Speak\" and listen !", completion: '<body><style>
  textarea {
  height: 20rem;
}

input[type="select"] {
}
</style>

    <div class="voiceinator">

      <h1 class="voiceinator-title">The Voiceinator 5000</h1>

      <select name="voice" id="voices">
        <option value="">Select A Voice</option>
      </select>

      <label for="rate">Rate:</label>
      <input name="rate" type="range" min="0" max="3" value="1" step="0.1">

      <label for="pitch">Pitch:</label>

      <input name="pitch" type="range" min="0" max="2" step="0.1">
      <textarea name="text">Hello! I love JavaScript 👍</textarea>
      <button id="stop">Stop!</button>
      <button id="speak">Speak</button>

    </div>

<script>
  const msg = new SpeechSynthesisUtterance();
  let voices = [];
  const voicesDropdown = document.querySelector("[name=\"voice\"]");
  const options = document.querySelectorAll("[type=\"range\"], [name=\"text\"]");
  const speakButton = document.querySelector("#speak");
  const stopButton = document.querySelector("#stop");

  msg.text = document.querySelector("[name=\"text\"]").value;

  function populateVoices() {
    voices = this.getVoices();
    voicesDropdown.innerHTML = voices
      .map(voice => `<option value="${voice.name}">${voice.name} (${voice.lang})</option>`)
      .join("");
  }

  function setVoice() {
    msg.voice = voices.find(voice => voice.name === this.value);
  }

  function toggleVoiceinator(startOver = true) {
    speechSynthesis.cancel();
    if(startOver) {
      speechSynthesis.speak(msg);
    }
  }

  function setOption() {
    console.log(this.name, this.value);
    msg[this.name] = this.value;
    toggleVoiceinator();
  }

  speechSynthesis.addEventListener("voiceschanged", populateVoices);
  voicesDropdown.addEventListener("change", setVoice);
  options.forEach(option => option.addEventListener("change", setOption));
  speakButton.addEventListener("click", toggleVoiceinator);
  stopButton.addEventListener("click", () => toggleVoiceinator(false));
</script>

</body>')

d24 = Draft.create!(name: "24 - Sticky Nav", completed: "Yes", intro: "Here we showcase how to fix a navbar when you scroll down. When you hit the top of hit it will trigger some actions, test it !", completion: '<body>
  <header class="header-sticky">
    <h1 class="title-sticky">A story about getting lost.</h1>
  </header>

  <nav class="nav-sticky" id="main">
    <ul>
      <li class="logo"><a href="#">LOST.</a></li>
      <li><a href="#">Home</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Images</a></li>
      <li><a href="#">Locations</a></li>
      <li><a href="#">Maps</a></li>
    </ul>
  </nav>

  <div class="site-wrap">

    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore tempora rerum, est autem cupiditate, corporis a qui libero ipsum delectus quidem dolor at nulla, adipisci veniam in reiciendis aut asperiores omnis blanditiis quod quas laborum nam! Fuga ad tempora in aspernatur pariatur fugit quibusdam dolores sunt esse magni, ut, dignissimos.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore tempora rerum, est autem cupiditate, corporis a qui libero ipsum delectus quidem dolor at nulla, adipisci veniam in reiciendis aut asperiores omnis blanditiis quod quas laborum nam! Fuga ad tempora in aspernatur pariatur fugit quibusdam dolores sunt esse magni, ut, dignissimos.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore tempora rerum, est autem cupiditate, corporis a qui libero ipsum delectus quidem dolor at nulla, adipisci veniam in reiciendis aut asperiores omnis blanditiis quod quas laborum nam! Fuga ad tempora in aspernatur pariatur fugit quibusdam dolores sunt esse magni, ut, dignissimos.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore tempora rerum, est autem cupiditate, corporis a qui libero ipsum delectus quidem dolor at nulla, adipisci veniam in reiciendis aut asperiores omnis blanditiis quod quas laborum nam! Fuga ad tempora in aspernatur pariatur fugit quibusdam dolores sunt esse magni, ut, dignissimos.</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore tempora rerum, est autem cupiditate, corporis a qui libero ipsum delectus quidem dolor at nulla, adipisci veniam in reiciendis aut asperiores omnis blanditiis quod quas laborum nam! Fuga ad tempora in aspernatur pariatur fugit quibusdam dolores sunt esse magni, ut, dignissimos.</p>

    <img src="http://unsplash.it/400/400" class="align-left slide-in">

    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates, deserunt facilis et iste corrupti omnis tenetur est. Iste ut est dicta dolor itaque adipisci, dolorum minima, veritatis earum provident error molestias. Ratione magni illo sint vel velit ut excepturi consectetur suscipit, earum modi accusamus voluptatem nostrum, praesentium numquam, reiciendis voluptas sit id quisquam. Consequatur in quis reprehenderit modi perspiciatis necessitatibus saepe, quidem, suscipit iure natus dignissimos ipsam, eligendi deleniti accusantium, rerum quibusdam fugit perferendis et optio recusandae sed ratione. Culpa, dolorum reprehenderit harum ab voluptas fuga, nisi eligendi natus maiores illum quas quos et aperiam aut doloremque optio maxime fugiat doloribus. Eum dolorum expedita quam, nesciunt</p>

    <img src="http://unsplash.it/400/400" class="align-right slide-in">

    <p> at provident praesentium atque quas rerum optio dignissimos repudiandae ullam illum quibusdam. Vel ad error quibusdam, illo ex totam placeat. Quos excepturi fuga, molestiae ea quisquam minus, ratione dicta consectetur officia omnis, doloribus voluptatibus? Veniam ipsum veritatis architecto, provident quas consequatur doloremque quam quidem earum expedita, ad delectus voluptatum, omnis praesentium nostrum qui aspernatur ea eaque adipisci et cumque ab? Ea voluptatum dolore itaque odio. Eius minima distinctio harum, officia ab nihil exercitationem. Tempora rem nemo nam temporibus molestias facilis minus ipsam quam doloribus consequatur debitis nesciunt tempore officiis aperiam quisquam, molestiae voluptates cum, fuga culpa. Distinctio accusamus quibusdam, tempore perspiciatis dolorum optio facere consequatur quidem ullam beatae architecto, ipsam sequi officiis dignissimos amet impedit natus necessitatibus tenetur repellendus dolor rem! Dicta dolorem, iure, facilis illo ex nihil ipsa amet officia, optio temporibus eum autem odit repellendus nisi. Possimus modi, corrupti error debitis doloribus dicta libero earum, sequi porro ut excepturi nostrum ea voluptatem nihil culpa? Ullam expedita eligendi obcaecati reiciendis velit provident omnis quas qui in corrupti est dolore facere ad hic, animi soluta assumenda consequuntur reprehenderit! Voluptate dolor nihil veniam laborum voluptas nisi pariatur sed optio accusantium quam consectetur, corrupti, sequi et consequuntur, excepturi doloremque. Tempore quis velit corporis neque fugit non sequi eaque rem hic. Facere, inventore, aspernatur. Accusantium modi atque, asperiores qui nobis soluta cumque suscipit excepturi possimus doloremque odit saepe perferendis temporibus molestiae nostrum voluptatum quis id sint quidem nesciunt culpa. Rerum labore dolor beatae blanditiis praesentium explicabo velit optio esse aperiam similique, voluptatem cum, maiores ipsa tempore. Reiciendis sed culpa atque inventore, nam ullam enim expedita consectetur id velit iusto alias vitae explicabo nemo neque odio reprehenderit soluta sint eaque. Aperiam, qui ut tenetur, voluptate doloremque officiis dicta quaerat voluptatem rerum natus magni. Eum amet autem dolor ullam.</p>
  </div>

<script>
  const nav = document.querySelector("#main");
  const topOfNav = nav.offsetTop;

  function fixNav() {
    if(window.scrollY >= topOfNav) {
      document.body.style.paddingTop = nav.offsetHeight + "px";
      document.body.classList.add("fixed-nav");
    } else {
      document.body.style.paddingTop = 0;
      document.body.classList.remove("fixed-nav");
    }
  }

  window.addEventListener("scroll", fixNav);
</script>
</body>')

d25 = Draft.create!(name: "25 - Event Capture, Propagation, Bubbling and Once", completed: "Yes", intro: "This one is to undestand the conditions of JavaScript method 'addEventListener'. Open the sourcecode and the console to see what happen when you click on an element. ", completion: '<body class="bod">

  <div class="one box-dimensions">
    <div class="two box-dimensions">
      <div class="three box-dimensions">
      </div>
    </div>
  </div>
<button class="box-dimensions">Click it many times, watch the result in the console !</button>
<script>
const divs = document.querySelectorAll("div");
const button = document.querySelector("button");

function logText(e) {
  console.log(this.classList.value, "No propagation");
  e.stopPropagation(); // Stop taking all parents/bubbling
}

divs.forEach(div => div.addEventListener("click", logText, {
  capture: false,
  once: true //run event only one time no matter how many click you do
}));

button.addEventListener("click", () => {
  console.log("Only one click recorded.");
}, {
  once: true
})
</script>
</body>')

d26 = Draft.create!(name: "26 - Stripe Follow Along Nav", completed: "Yes", completion: '<body>
  <h2 class="dropdown-title">Cool</h2>
  <nav class="dropdown-nav top">
    <div class="dropdownBackground">
      <span class="arrow"></span>
    </div>

    <ul class="cool">
      <li>
        <a href="#">About Me</a>
        <div class="dropdown dropdown1">
          <div class="bio">
            <img src="https://logo.clearbit.com/wesbos.com">
            <p>Wes Bos sure does love web development. He teaches things like JavaScript, CSS and BBQ. Wait. BBQ isn`t part of web development. It should be though!</p>
          </div>
        </div>
      </li>
      <li>
        <a href="#">Courses</a>
        <ul class="dropdown courses">
          <li>
            <span class="code">RFB</span>
            <a href="https://ReactForBeginners.com">React For Beginners</a>
          </li>
          <li>
            <span class="code">ES6</span>
            <a href="https://ES6.io">ES6 For Everyone</a>
          </li>
          <li>
            <span class="code">NODE</span>
            <a href="https://LearnNode.com">Learn Node</a>
          </li>
          <li>
            <span class="code">STPU</span>
            <a href="https://SublimeTextBook.com">Sublime Text Power User</a>
          </li>
          <li>
            <span class="code">WTF</span>
            <a href="http://Flexbox.io">What The Flexbox?!</a>
          </li>
          <li>
            <span class="code">GRID</span>
            <a href="https://CSSGrid.io">CSS Grid</a>
          </li>
          <li>
            <span class="code">LRX</span>
            <a href="http://LearnRedux.com">Learn Redux</a>
          </li>
          <li>
            <span class="code">CLPU</span>
            <a href="http://CommandLinePowerUser.com">Command Line Power User</a>
          </li>
          <li>
            <span class="code">MMD</span>
            <a href="http://MasteringMarkdown.com">Mastering Markdown</a>
          </li>
        </ul>
      </li>
      <li>
        <a href="#">Other Links</a>
        <ul class="dropdown dropdown3">
          <li><a class="button" href="http://twitter.com/wesbos">Twitter</a></li>
          <li><a class="button" href="http://facebook.com/wesbos.developer">Facebook</a></li>
          <li><a class="button" href="http://wesbos.com">Blog</a></li>
          <li><a class="button" href="http://wesbos.com/courses">Course Catalog</a></li>
        </ul>
      </li>
    </ul>
  </nav>
<script>
  const triggers = document.querySelectorAll(".cool > li");
  const background = document.querySelector(".dropdownBackground");
  const nav = document.querySelector(".top");

  function handleEnter() {
    this.classList.add("trigger-enter");
    setTimeout(() => this.classList.contains("trigger-enter") && this.classList.add("trigger-enter-active"), 150);
    background.classList.add("open");

    const dropdown = this.querySelector(".dropdown");
    const dropdownCoords = dropdown.getBoundingClientRect();
    const navCoords = nav.getBoundingClientRect();

    const coords = {
      height: dropdownCoords.height,
      width: dropdownCoords.width,
      top: dropdownCoords.top - navCoords.top,
      left: dropdownCoords.left - navCoords.left
    };

    background.style.setProperty("width", `${coords.width}px`);
    background.style.setProperty("height", `${coords.height}px`);
    background.style.setProperty("transform", `translate(${coords.left}px, ${coords.top}px)`);
  }

  function handleLeave() {
    this.classList.remove("trigger-enter", "trigger-enter-active");
    background.classList.remove("open");
  }

  triggers.forEach(trigger => trigger.addEventListener("mouseenter", handleEnter));
  triggers.forEach(trigger => trigger.addEventListener("mouseleave", handleLeave));
</script>
</body>')

d27 = Draft.create!(name: "27 - Click and Drag", completed: "No")

d28 = Draft.create!(name: "28 - Video Speed Controller", completed: "No")

d29 = Draft.create!(name: "29 - Countdown Timer", completed: "No")

d30 = Draft.create!(name: "30 - Whack A Mole", completed: "No")

puts "End seed"
