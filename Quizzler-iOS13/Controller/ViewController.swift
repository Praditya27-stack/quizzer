//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain =  QuizBrain ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateQuiz()
    }


    @IBAction func answerButtton(_ sender: UIButton) {
    
    
        let userAnswer = sender.currentTitle!
        let actualAnswer = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if  actualAnswer{
            sender.backgroundColor = UIColor.cyan
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (updateQuiz), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateQuiz(){
        quizLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        falseButton.backgroundColor =  UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
      
    }
}

