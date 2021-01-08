# Word Scramble for iOS ✏️

Word Scramble is a simple iOS game made using SwiftUI framework. At the start of the game the user is shown a random word from a pool of over 13000. Player's goal
is simple - to create as many existing words as possible from letters that occur in a given word. There are few rules: a word cannot be shorter than 4 characters and
it cannot be the same as the starting word. Player's score is counted and shown at the bottom of the screen. Next word can be shown by pressing a button visible in the
upper right corner.

<p align="center">
  <img width="765" height="482" src="https://i.postimg.cc/v8SYLLMW/merge-from-ofoct.jpg">
</p>

# Implementation 👨‍💻

- User answers are stored in an array that is shown as a list
- Word existance is checked using UIKit UITextChecker function

# Written using 🔧

- Swift 5
- SwiftUI framework
- Parts of UIKit framewor
