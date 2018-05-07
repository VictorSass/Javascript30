

puts "Launching test seed"

puts "Destroying previous entries"
Draft.destroy_all

puts "Creating new entries"

d1 = Draft.create!(name: "01 - JavaScript Drum Kit", completion: '<div class="keys">
    <div data-key="65" class="key">
      <kbd>A</kbd>
      <span class="sound">clap</span>
    </div>
    <div data-key="83" class="key">
      <kbd>S</kbd>
      <span class="sound">hihat</span>
    </div>
    <div data-key="68" class="key">
      <kbd>D</kbd>
      <span class="sound">kick</span>
    </div>
    <div data-key="70" class="key">
      <kbd>F</kbd>
      <span class="sound">openhat</span>
    </div>
    <div data-key="71" class="key">
      <kbd>G</kbd>
      <span class="sound">boom</span>
    </div>
    <div data-key="72" class="key">
      <kbd>H</kbd>
      <span class="sound">ride</span>
    </div>
    <div data-key="74" class="key">
      <kbd>J</kbd>
      <span class="sound">snare</span>
    </div>
    <div data-key="75" class="key">
      <kbd>K</kbd>
      <span class="sound">tom</span>
    </div>
    <div data-key="76" class="key">
      <kbd>L</kbd>
      <span class="sound">tink</span>
    </div>
  </div>

  <audio data-key="65" src="sounds/clap.wav"></audio>
  <audio data-key="83" src="sounds/hihat.wav"></audio>
  <audio data-key="68" src="sounds/kick.wav"></audio>
  <audio data-key="70" src="sounds/openhat.wav"></audio>
  <audio data-key="71" src="sounds/boom.wav"></audio>
  <audio data-key="72" src="sounds/ride.wav"></audio>
  <audio data-key="74" src="sounds/snare.wav"></audio>
  <audio data-key="75" src="sounds/tom.wav"></audio>
  <audio data-key="76" src="sounds/tink.wav"></audio>

<script>
  function removeTransition(e) {
    if (e.propertyName !== "transform") return;
    e.target.classList.remove("playing");
  }
  function playSound(e) {
    const audio = document.querySelector(`audio[data-key="${e.keyCode}"]`);
    const key = document.querySelector(`div[data-key="${e.keyCode}"]`);
    if (!audio) return;
    key.classList.add("playing");
    audio.currentTime = 0;
    audio.play();
  }
  const keys = Array.from(document.querySelectorAll(".key"));
  keys.forEach(key => key.addEventListener("transitionend", removeTransition));
  window.addEventListener("keydown", playSound);
</script>')

d2 = Draft.create!(name: "02 - JS and CSS Clock", completion: '<div class="clock">
      <div class="clock-face">
        <div class="hand hour-hand"></div>
        <div class="hand min-hand"></div>
        <div class="hand second-hand"></div>
      </div>
    </div>


  <style>
    html {
      background:#018DED url(http://unsplash.it/1500/1000?image=881&blur=50);
      background-size:cover;
      font-family:"helvetica neue";
      text-align: center;
      font-size: 10px;
    }
    body {
      margin: 0;
      font-size: 2rem;
      display:flex;
      flex:1;
      min-height: 100vh;
      align-items: center;
    }
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
      transform: translateY(-3px); /* account for the height of the clock hands */
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

d3 = Draft.create!(name: "03 - CSS Variables")
d4 = Draft.create!(name: "04 - Array Cardio Day 1")
d5 = Draft.create!(name: "05 - Flex Panel Gallery")
d6 = Draft.create!(name: "06 - Type Ahead")
d7 = Draft.create!(name: "07 - Array Cardio Day 2")
d8 = Draft.create!(name: "08 - Fun with HTML5 Canvas")
d9 = Draft.create!(name: "09 - Dev Tools Domination")
d10 = Draft.create!(name: "10 - Hold Shift and Check Checkboxes")
d11 = Draft.create!(name: "11 - Custom Video Player")
d12 = Draft.create!(name: "12 - Key Sequence Detection")
d13 = Draft.create!(name: "13 - Slide in on Scroll")
d14 = Draft.create!(name: "14 - JavaScript References VS Copying")
d15 = Draft.create!(name: "15 - LocalStorage")
d16 = Draft.create!(name: "16 - Mouse Move Shadow")
d17 = Draft.create!(name: "17 - Sort Without Articles")
d18 = Draft.create!(name: "18 - Adding Up Times with Reduce")
d19 = Draft.create!(name: "19 - Webcam Fun")
d20 = Draft.create!(name: "20 - Speech Detection")
d21 = Draft.create!(name: "21 - Geolocation")
d22 = Draft.create!(name: "22 - Follow Along Link Highlighter")
d23 = Draft.create!(name: "23 - Speech Synthesis")
d24 = Draft.create!(name: "24 - Sticky Nav")
d25 = Draft.create!(name: "25 - Event Capture, Propagation, Bubbling and Once")
d26 = Draft.create!(name: "26 - Stripe Follow Along Nav")
d27 = Draft.create!(name: "27 - Click and Drag")
d28 = Draft.create!(name: "28 - Video Speed Controller")
d29 = Draft.create!(name: "29 - Countdown Timer")
d30 = Draft.create!(name: "30 - Whack A Mole")


puts "End seed"
