

puts "Launching test seed"

puts "Destroying previous entries"
Draft.destroy_all

puts "Creating new entries"

d1 = Draft.create!(name: "01 - JavaScript Drum Kit", completed: "Yes", intro: "In this exercise, we're gonna make a Javacript drumkit that play a
  sound when you hit the corresponding key but also do a subtle CSS animation /!\ Currently fixing sound not working", completion: '<body>


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

  <audio data-key="65" src="clap.wav"></audio>
  <audio data-key="90" src="sounds/hihat.wav"></audio>
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
 clock that takes the current time from Javascript and update itself every second", completion: '<div class="clock">
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

d3 = Draft.create!(name: "03 - CSS Variables", completed: "No")
d4 = Draft.create!(name: "04 - Array Cardio Day 1", completed: "No")
d5 = Draft.create!(name: "05 - Flex Panel Gallery", completed: "No")
d6 = Draft.create!(name: "06 - Type Ahead", completed: "No")
d7 = Draft.create!(name: "07 - Array Cardio Day 2", completed: "No")
d8 = Draft.create!(name: "08 - Fun with HTML5 Canvas", completed: "No")
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
