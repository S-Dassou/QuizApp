//
//  QuizResultsViewController.swift
//  quizApp
//
//  Created by shafique dassu on 17/02/2023.
//

import UIKit

class QuizResultsViewController: UIViewController {

    
    @IBOutlet weak var resultsLabel: UILabel!
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultsLabel.text = "\(score) / 3"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
