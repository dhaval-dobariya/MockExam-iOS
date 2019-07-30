//
//  ExamResultViewController.swift
//  MockExams
//
//  Created by Dhaval on 22/07/19.
//  Copyright © 2019 Monarchy Infotech. All rights reserved.
//

import UIKit

class ExamResultViewController: UIViewController {

    var subjectViewModel : SubjectViewModel!
    @IBOutlet weak var totalQuestions: UILabel!
    @IBOutlet weak var totalAttempts: UILabel!
    @IBOutlet weak var totalCorrectAnswers: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated:true);

        self.title = "Exam Result"

        totalQuestions.text = String(subjectViewModel.questions.count)
        totalAttempts.text = String((subjectViewModel.questions.filter { $0.userGivenAnswer != nil }).count)
        totalCorrectAnswers.text = String((subjectViewModel.questions.filter { $0.userGivenAnswer == $0.correctAnswer }).count)

    }
    
    @IBAction func backToHomeTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
