//
//  QuestionViewModel.swift
//  MockExams
//
//  Created by Dhaval on 15/07/19.
//  Copyright © 2019 Monarchy Infotech. All rights reserved.
//

class QuestionViewModel {
    
    var question : String!
    var options : [Option]!
    var answer : Int!
    var maxAllowedTime : Double!
//    var timeTakenByUserInSeconds : Int!
    
    init(question : Question) {
        
        self.question = question.question
        self.options = question.options
        self.answer = question.correctAnswer
        self.maxAllowedTime = question.maxAllowedTime
//        self.timeTakenByUserInSeconds = question.timeTakenByUserInSeconds
        
    }
}
