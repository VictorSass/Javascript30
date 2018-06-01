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

d6 = Draft.create!(name: "06 - Type Ahead", completed: "Yes", intro: "Today, the goal is to create a feature that update suggestions everytime an input is made in the searchbar", completion: '<body>
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

d10 = Draft.create!(name: "10 - Hold Shift and Check Checkboxes", completed: "Yes", intro: "Below is a form that allow you to check multiple boxes holding the shift button.", completion: '<body>
  <style>
    html {
      font-family: sans-serif;
    }
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
      <p>This is an inbox layout.</p>
    </div>
    <div class="item">
      <input type="checkbox">
      <p>Check one item</p>
    </div>
    <div class="item">
      <input type="checkbox">
      <p>Hold down your Shift key</p>
    </div>
    <div class="item">
      <input type="checkbox">
      <p>Check a lower item</p>
    </div>
    <div class="item">
      <input type="checkbox">
      <p>Everything inbetween should also be set to checked</p>
    </div>
    <div class="item">
      <input type="checkbox">
      <p>Watch the console</p>
    </div>
    <div class="item">
      <input type="checkbox">
      <p>To see the the JS at work</p>
    </div>
    <div class="item">
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
</body>
</html>
')

d13 = Draft.create!(name: "13 - Slide in on Scroll", completed: "Yes", completion: '<body>
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
