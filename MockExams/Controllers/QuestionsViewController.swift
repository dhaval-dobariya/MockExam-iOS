//
//  QuestionsViewController.swift
//  MockExams
//
//  Created by Dhaval on 15/07/19.
//  Copyright © 2019 Monarchy Infotech. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class QuestionsViewController: UIViewController {

    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var optionsTableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    var questionViewModels : [QuestionViewModel]!
    var subjectViewModel : SubjectViewModel!
    var lastSelectedIndex : IndexPath!
    var currentQuestion : Int = -1
    private var disposeBag = DisposeBag()
    var timer : Timer!
    var timerStartAt : Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // To solve the black navigation background color problem when controller is popped
        navigationController?.view.backgroundColor = UIColor.white

        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        } else {
            // Fallback on earlier versions
        }
        
        questionViewModels = subjectViewModel.questions.map( { return QuestionViewModel(question: $0) })
        
        self.nextButton.sendActions(for: .touchUpInside)

//        setupCellConfiguration(forQuestion : questionViewModels[currentQuestion])

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        timer.invalidate()
    }
    
    //MARK: Setup Rx
    func setupCellConfiguration(forQuestion questionViewModel : QuestionViewModel) {
        
        //MARK: Init data
        let tableDataBiewModels: BehaviorRelay<[OptionViewModel]> = BehaviorRelay(value: [])
        let optionViewModels = questionViewModel.options.map { return OptionViewModel(option: $0) }
        tableDataBiewModels.accept(optionViewModels)
        
        question.text = questionViewModel.question
        var totalTime = questionViewModel.maxAllowedTime ?? 0
        
        timerStartAt = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            totalTime = totalTime - 1
            
            if totalTime > 0.0 {
                let min = floor((totalTime.truncatingRemainder(dividingBy: 3600)) / 60)
                let sec = floor(totalTime.truncatingRemainder(dividingBy: 3600)).truncatingRemainder(dividingBy: 60)
                
                self.timeLeft.text = String(format: "Time left: %g", min) + ":" + String(format: "%g", sec)
            }
            else {
                self.nextButton.sendActions(for: .touchUpInside)
            }
        }
        
        //MARK: Fill data into Table
        tableDataBiewModels
            .bind(to: optionsTableView.rx.items(cellIdentifier: OptionTableViewCell.Identifier)) { (index, optionViewModel : OptionViewModel, cell : OptionTableViewCell) in
                
                cell.optionViewModel = optionViewModel
                
            }
            .disposed(by: disposeBag)
        
        //MARK: To hanlde option selection
        optionsTableView.rx.itemSelected
            .subscribe(onNext: { (indexPath) in
                
                if self.lastSelectedIndex != nil  {
                    let previousCell = self.optionsTableView.cellForRow(at: self.lastSelectedIndex) as! OptionTableViewCell
                    previousCell.setOptionSelected(isSelected: false)
                }
                
                let cell = self.optionsTableView.cellForRow(at: indexPath) as! OptionTableViewCell
                cell.setOptionSelected(isSelected: true)
                
                self.lastSelectedIndex = indexPath
            })
        .disposed(by: disposeBag)
        
    }

    //MARK: IBActions
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if self.currentQuestion > -1 && self.lastSelectedIndex != nil {
            updateQuestionDetails(question: self.subjectViewModel.questions[self.currentQuestion])
        }
        
        currentQuestion += 1

        self.lastSelectedIndex = nil
        disposeBag = DisposeBag()
        
        timer?.invalidate()
        self.timeLeft.text = ""
        
        if questionViewModels.count > currentQuestion {
            setupCellConfiguration(forQuestion : questionViewModels[currentQuestion])
        }
        
        var title = "Next"
        if ((questionViewModels.count - 1) == currentQuestion) {
            title = "Finish"
        }
        else if (questionViewModels.count == currentQuestion) {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "ExamResultViewController") as! ExamResultViewController
            controller.subjectViewModel = subjectViewModel
              self.navigationController?.pushViewController(controller, animated: true)
        }
        sender.setTitle(title, for: .normal)

    }
    
    func updateQuestionDetails(question : Question) {
        let components = Calendar.current.dateComponents([.minute, .second], from: self.timerStartAt, to: Date())
        
        let min = components.minute ?? 0
        let sec = components.second ?? 0
        print("difference is \(min) minute and \(sec) second")
        
        let seconds = sec + (min * 60)
        
        //Update Question's Model
        question.timeTakenByUserInSeconds = seconds
        question.userGivenAnswer = lastSelectedIndex.row + 1

    }
}
