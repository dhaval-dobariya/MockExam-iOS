//
//  SubjectsViewController.swift
//  MockExams
//
//  Created by Dhaval on 21/06/19.
//  Copyright © 2019 Monarchy Infotech. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SubjectsViewController: UIViewController {
    
    @IBOutlet weak var subjectsTableView: UITableView!
    var subjectViewModels : [SubjectViewModel]!
    //    var subjectViewModels: BehaviorRelay<[SubjectViewModel]> = BehaviorRelay(value: [])
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Subject().fetchSubjects(successBlock: { (subjects) in
            
            self.subjectViewModels = subjects.map( { return SubjectViewModel(subject: $0) })
            
            self.setupCellConfiguration()

        }) { (error) in
            Utilities.showAlert(strTitle: error, strMessage: nil, parent: self, OKButtonTitle: nil, CancelButtonTitle: nil, okBlock: nil, cancelBlock: nil)
        }
        
//        fetchSubjects()
        self.subjectsTableView.separatorColor = UIColor.white

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Mock Exam"
        navigationController?.navigationBar.topItem?.title = "Mock Exam"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }

    }
    
    func fetchSubjects() {
        let subjects = [
            Subject(subject: "iOS",
                    questions: [
                        Question(question: "Question 1",
                                 options: [
                                    Option(index: 0, option: "Option 1 1"),
                                    Option(index: 1, option: "Option 1 2"),
                                    Option(index: 2, option: "Option 1 3"),
                                    Option(index: 3, option: "Option 1 4")
                            ],
                                 answer: 1,
                                 maxAllowedTime: 120
                        ),
                        Question(question: "Question 2",
                                 options: [
                                    Option(index: 0, option: "Option 2 1"),
                                    Option(index: 1, option: "Option 2 2"),
                                    Option(index: 2, option: "Option 2 3"),
                                    Option(index: 3, option: "Option 2 4")
                            ],
                                 answer: 2,
                                 maxAllowedTime: 130),
                        Question(question: "Question 3",
                                 options: [
                                    Option(index: 0, option: "Option 3 1"),
                                    Option(index: 1, option: "Option 3 2"),
                                    Option(index: 2, option: "Option 3 3"),
                                    Option(index: 3, option: "Option 3 4")
                            ],
                                 answer: 3,
                                 maxAllowedTime: 140),
                        Question(question: "Question 4",
                                 options: [
                                    Option(index: 0, option: "Option 4 1"),
                                    Option(index: 1, option: "Option 4 2"),
                                    Option(index: 2, option: "Option 4 3"),
                                    Option(index: 3, option: "Option 4 4")
                            ],
                                 answer: 4,
                                 maxAllowedTime: 150),
                ],
                    createdOn: Date(),
                    lastUpdatedOn: Date()),
            Subject(subject: "Android",
                    questions: [
                        Question(question: "Question 1",
                                 options: [
                                    Option(index: 0, option: "Option 1"),
                                    Option(index: 1, option: "Option 2"),
                                    Option(index: 2, option: "Option 3"),
                                    Option(index: 3, option: "Option 4")
                            ],
                                 answer: 1),
                        Question(question: "Question 2",
                                 options: [
                                    Option(index: 0, option: "Option 1"),
                                    Option(index: 1, option: "Option 2"),
                                    Option(index: 2, option: "Option 3"),
                                    Option(index: 3, option: "Option 4")
                            ],
                                 answer: 1),
                        Question(question: "Question 3",
                                 options: [
                                    Option(index: 0, option: "Option 1"),
                                    Option(index: 1, option: "Option 2"),
                                    Option(index: 2, option: "Option 3"),
                                    Option(index: 3, option: "Option 4")
                            ],
                                 answer: 1),
                        Question(question: "Question 4",
                                 options: [
                                    Option(index: 0, option: "Option 1"),
                                    Option(index: 1, option: "Option 2"),
                                    Option(index: 2, option: "Option 3"),
                                    Option(index: 3, option: "Option 4")
                            ],
                                 answer: 1),
                ],
                    createdOn: Date(),
                    lastUpdatedOn: Date()),
            Subject(subject: "Java",
                    questions: [
                        Question(question: "Question 1",
                                 options: [
                                    Option(index: 0, option: "Option 1"),
                                    Option(index: 1, option: "Option 2"),
                                    Option(index: 2, option: "Option 3"),
                                    Option(index: 3, option: "Option 4")
                            ],
                                 answer: 1),
                        Question(question: "Question 2",
                                 options: [
                                    Option(index: 0, option: "Option 1"),
                                    Option(index: 1, option: "Option 2"),
                                    Option(index: 2, option: "Option 3"),
                                    Option(index: 3, option: "Option 4")
                            ],
                                 answer: 1),
                        Question(question: "Question 3",
                                 options: [
                                    Option(index: 0, option: "Option 1"),
                                    Option(index: 1, option: "Option 2"),
                                    Option(index: 2, option: "Option 3"),
                                    Option(index: 3, option: "Option 4")
                            ],
                                 answer: 1),
                        Question(question: "Question 4",
                                 options: [
                                    Option(index: 0, option: "Option 1"),
                                    Option(index: 1, option: "Option 2"),
                                    Option(index: 2, option: "Option 3"),
                                    Option(index: 3, option: "Option 4")
                            ],
                                 answer: 1),
                ],
                    createdOn: Date(),
                    lastUpdatedOn: Date()),
            Subject(subject: "Python",
                    questions: [
                        Question(question: "Question 1",
                                 options: [
                                    Option(index: 0, option: "Option 1"),
                                    Option(index: 1, option: "Option 2"),
                                    Option(index: 2, option: "Option 3"),
                                    Option(index: 3, option: "Option 4")
                            ],
                                 answer: 1),
                        Question(question: "Question 2",
                                 options: [
                                    Option(index: 0, option: "Option 1"),
                                    Option(index: 1, option: "Option 2"),
                                    Option(index: 2, option: "Option 3"),
                                    Option(index: 3, option: "Option 4")
                            ],
                                 answer: 1),
                        Question(question: "Question 3",
                                 options: [
                                    Option(index: 0, option: "Option 1"),
                                    Option(index: 1, option: "Option 2"),
                                    Option(index: 2, option: "Option 3"),
                                    Option(index: 3, option: "Option 4")
                            ],
                                 answer: 1),
                        Question(question: "Question 4",
                                 options: [
                                    Option(index: 0, option: "Option 1"),
                                    Option(index: 1, option: "Option 2"),
                                    Option(index: 2, option: "Option 3"),
                                    Option(index: 3, option: "Option 4")
                            ],
                                 answer: 1),
                ],
                    createdOn: Date(),
                    lastUpdatedOn: Date())
        ]
        
        subjectViewModels = subjects.map( { return SubjectViewModel(subject: $0) })
        
        setupCellConfiguration()
        
    }
    
    //MARK: Setup Rx
    func setupCellConfiguration() {
        
        let tableDataBiewModels: BehaviorRelay<[SubjectViewModel]> = BehaviorRelay(value: [])
        tableDataBiewModels.accept(subjectViewModels)
        
        tableDataBiewModels
            .bind(to: subjectsTableView.rx.items(cellIdentifier: SubjectTableViewCell.Identifier)) { (index, subjectViewModel : SubjectViewModel, cell : SubjectTableViewCell) in
                
                cell.subjectViewModel = subjectViewModel
                
            }
            .disposed(by: disposeBag)
        
        
        subjectsTableView.rx.modelSelected(SubjectViewModel.self)
            .subscribe(onNext: { [weak self] subjectViewModel in
                
                let controller = self?.storyboard?.instantiateViewController(withIdentifier: "QuestionsViewController") as! QuestionsViewController
                controller.subjectViewModel = subjectViewModel
                self?.navigationController?.pushViewController(controller, animated: true)
                
                print(subjectViewModel.detailText)
                
            }).disposed(by: disposeBag)
    }
    
    func setupCartObserver() {
        //1
        //        subjectViewModels.asObservable()
        //            .subscribe(onNext: { //2
        //                [unowned self] subjectViewModels in
        //
        ////                self.cartButton.title = "\(chocolates.count) \u{1f36b}"
        //            })
        //            .disposed(by: disposeBag) //3
    }
}


