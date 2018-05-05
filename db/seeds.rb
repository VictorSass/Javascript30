

puts "Launching test seed"

puts "Destroying previous entries"
Draft.destroy_all

puts "Creating new entries"

d1 = Draft.create!(name: "JavaScript Drum Kit")
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
