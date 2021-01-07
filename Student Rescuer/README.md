# Student Rescuer for iOS 🍺

Student Rescuer is a simple iOS app powered by Machine Learning that was made using SwiftUI & CoreML frameworks. It's the third project created when learning with the Hacking with Swift website.
According to the user's input (wake-up time, number of hours of sleep wanted and cups of coffee consumed) the app estimates the best time one should go to sleep to actually get optimal rest
according to the provided schedule. Output is displayed in a convenient alert.

<p align="center">
  <img width="612" height="578" src="https://i.postimg.cc/sDzgcZKw/imgonline-com-ua-twotoone-a-Ndj0cw2j6cs-T.jpg">
</p>

# Implementation 👨‍💻

- Machine Learning model was trained using Linear Regression algorithm on data containg 10 000 keys
- Input is implemented using DatePicker and two Steppers
- All calculations on dates are performed safely using functions provided by Apple
- Output is displayed using a convenient alert

# Written using 🔧

- Swift 5
- SwiftUI framework
- CoreML framework
