# iExpense for iOS 💸

iExpense is a simple expense tracker for iOS, that uses multiple views. In the program user can easily add new expenses by typing name, value and category of the
expense. It's shown in a list, from which certain items can be deleted by gestures known from iOS. iExpense saves user input and displays it when the app is launched
again. Data is stored in a JSON file. 

<p align="center">
  <img width="765" height="482" src="https://i.postimg.cc/rss8BRFT/merge-from-ofoct-4.jpg">
</p>

# Implementation 👨‍💻

- In this project multiple views are implemented using Sheets
- User input is encoded and decoded using JSONEncoder & JSONDecoder
- App relies on shared variables (@ObservedObject, @Environment, @Published)

# Written using 🔧

- Swift 5
- SwiftUI framework
