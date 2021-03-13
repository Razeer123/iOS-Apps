//
//  ViewController.swift
//  GuessTheFlag - UIKit
//
//  Created by Michał Derej on 13/03/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    @IBOutlet var label: UILabel!
    
    var countries = [String]()
    var score = 1
    var questionsAsked = 0
    var correctAnswer = Int.random(in: 0...2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        buttonOne.layer.borderWidth = 1;
        buttonTwo.layer.borderWidth = 1;
        buttonThree.layer.borderWidth = 1;
        
        buttonOne.layer.borderColor = UIColor.lightGray.cgColor
        buttonTwo.layer.borderColor = UIColor.lightGray.cgColor
        buttonThree.layer.borderColor = UIColor.lightGray.cgColor
        
        label.text = "Your score is \(score)"
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        buttonOne.setImage(UIImage(named: countries[0]), for: .normal)
        buttonTwo.setImage(UIImage(named: countries[1]), for: .normal)
        buttonThree.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "Pick the flag of " + countries[correctAnswer].uppercased()
        
        questionsAsked += 1
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        
        if (sender.tag == correctAnswer) {
            score += 1
            title = "Correct"
        } else {
            score -= 1
            title = "Wrong! That's the flag of " + countries[sender.tag].uppercased()
        }
        
        label.text = "Your score is \(score)"
        
        var alertController = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        if (questionsAsked == 9) {
            alertController = UIAlertController(title: "Congratulations!", message: "Your final score is \(score)", preferredStyle: .alert)
        }
        
        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(alertController, animated: true)
        
        if (questionsAsked == 9) {
            questionsAsked = 0
            score = 0
        }
    }
}
