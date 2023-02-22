//
//  ViewController.swift
//  quizApp
//
//  Created by shafique dassu on 13/02/2023.
//

import UIKit

struct Question {
    let questionImage: UIImage
    let correctAnswer: Int
    let answerOne: String
    let answerTwo: String
    let answerThree: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    var score = 0
    var currentQuestionIndex = 0
    
    let questions: [Question] = [
        Question(questionImage: UIImage(named: "lion")!, correctAnswer: 2, answerOne: "Giraffe", answerTwo: "Lion", answerThree: "Buffalo"),
        Question(questionImage: UIImage(named: "giraffe")!, correctAnswer: 1, answerOne: "Giraffe", answerTwo: "Lion", answerThree: "Chicken"),
        Question(questionImage: UIImage(named: "buffalo")!, correctAnswer: 3, answerOne: "Bird", answerTwo: "Hyena", answerThree: "Buffalo")
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! QuizResultsViewController
        destinationVC.score = score
        destinationVC.questionsCount = questions.count
    }
    
    func loadQuestion() {
        let question = questions[currentQuestionIndex]
        questionImageView.image = question.questionImage
        answerOneButton.setTitle(question.answerOne, for: .normal)
        answerTwoButton.setTitle(question.answerTwo, for: .normal)
        answerThreeButton.setTitle(question.answerThree, for: .normal)
    }
    
    func check(answer: Int) {
        if questions[currentQuestionIndex].correctAnswer == answer {
            score += 1
            scoreLabel.text = "Score: \(score)"
            presentScoreAlert(title: "Correct", message: "Good Job")
        } else {
            presentScoreAlert(title: "Wrong", message: "Incorrect Answer")
        }
        
        }
    
    func presentScoreAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if self.questions.count - 1 == self.currentQuestionIndex {
                self.performSegue(withIdentifier: "QuizResultsSegue", sender: nil)
                self.currentQuestionIndex = 0
                self.loadQuestion()
                self.score = 0
                self.scoreLabel.text = "Score: 0"
            } else {
                self.currentQuestionIndex += 1
                self.loadQuestion()
            }
          
        }
        alert.addAction(okAction)
        present(alert, animated: true)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
    }
    
    @IBAction func answerOneButtonTapped(_ sender: Any) {
       check(answer: 1)
    }
    @IBAction func answerTwoButtonTapped(_ sender: Any) {
        check(answer: 2)
    }
    @IBAction func answerThreeButtonTapped(_ sender: Any) {
        check(answer: 3)
    }
         
    }
