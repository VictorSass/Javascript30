

puts "Launching test seed"

puts "Destroying previous entries"
Draft.destroy_all

puts "Creating new entries"

d1 = Draft.create!(name: "JavaScript Drum Kit", completion: '<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>JS Drum Kit</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>


  <div class="keys">
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
</script>


</body>
</html>')





d2 = Draft.create!(name: "JS and CSS Clock")
d3 = Draft.create!(name: "CSS Variables")
d4 = Draft.create!(name: "Array Cardio Day 1")
d5 = Draft.create!(name: "Flex Panel Gallery")
d6 = Draft.create!(name: "Type Ahead")
d7 = Draft.create!(name: "Array Cardio Day 2")
d8 = Draft.create!(name: "Fun with HTML5 Canvas")
d9 = Draft.create!(name: "Dev Tools Domination")
d10 = Draft.create!(name: "Hold Shift and Check Checkboxes")
d11 = Draft.create!(name: "Custom Video Player")
d12 = Draft.create!(name: "Key Sequence Detection")
d13 = Draft.create!(name: "Slide in on Scroll")
d14 = Draft.create!(name: "JJavaScript References VS Copying")
d15 = Draft.create!(name: "LocalStorage")
d16 = Draft.create!(name: "Mouse Move Shadow")
d17 = Draft.create!(name: "Sort Without Articles")
d18 = Draft.create!(name: "Adding Up Times with Reduce")
d19 = Draft.create!(name: "Webcam Fun")
d20 = Draft.create!(name: "Speech Detection")
d21 = Draft.create!(name: "Geolocation")
d22 = Draft.create!(name: "Follow Along Link Highlighter")
d23 = Draft.create!(name: "Speech Synthesis")
d24 = Draft.create!(name: "Sticky Nav")
d25 = Draft.create!(name: "Event Capture, Propagation, Bubbling and Once")
d26 = Draft.create!(name: "Stripe Follow Along Nav")
d27 = Draft.create!(name: "Click and Drag")
d28 = Draft.create!(name: "Video Speed Controller")
d29 = Draft.create!(name: "Countdown Timer")
d30 = Draft.create!(name: "Whack A Mole")


puts "End seed"
