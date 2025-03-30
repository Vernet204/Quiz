//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//add question number and added background color to match righyt and wrong colo4

import UIKit

class ViewController: UIViewController {
    @IBOutlet var backView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionCounterLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    
    var quizBrian = QuizBrian()
    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
        
    }

    @IBAction func answeredButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let youWereCorrect = quizBrian.checkAnswer(userAnswer)
        
        if youWereCorrect{
            sender.backgroundColor = UIColor.green
            backView.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
            backView.backgroundColor = UIColor.red
        }
        
        quizBrian.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector (updateUI), userInfo: nil, repeats: false)
       
    }
    @objc func updateUI() {
        questionLabel.text = quizBrian.getQuestionText()
        progressBar.progress = quizBrian.getProgress()
        questionNumberLabel.text = "Question Number : \(quizBrian.getNum())"
        questionCounterLabel.text = "Score: \(quizBrian.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        backView.backgroundColor = UIColor.blue
      
    }
}

