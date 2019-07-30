//
//  SubjectViewModel.swift
//  MockExams
//
//  Created by Dhaval on 28/06/19.
//  Copyright © 2019 Monarchy Infotech. All rights reserved.
//

class SubjectViewModel {

    var name : String
    var detailText : String
    var questions: [Question]
    
    init(subject : Subject) {
        self.name = subject.subject
        self.detailText = "Total questions : \(subject.questions.count)"
        self.questions = subject.questions
    }
    
}
