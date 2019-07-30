//
//  Question.swift
//  MockExams
//
//  Created by Dhaval on 21/06/19.
//  Copyright © 2019 Monarchy Infotech. All rights reserved.
//

import Foundation

//MARK: To store option detials, which helps to declare results and manage data properly
struct Option: Codable {
    let index : Int
    let option : String
}

//MARK: To store question's details with options and correct answer
class Question: Codable {
    var question : String!
    var options : [Option]!
    var correctAnswer : Int!
    var userGivenAnswer : Int!
    var maxAllowedTime : TimeInterval!
    var timeTakenByUserInSeconds : Int!
    
    init(question : String, options : [Option], answer : Int, maxAllowedTime : TimeInterval? = nil, timeTakenByUser : Int? = nil) {
        
        self.question = question
        self.options = options
        self.correctAnswer = answer
        self.maxAllowedTime = maxAllowedTime
        self.timeTakenByUserInSeconds = timeTakenByUser
        
    }
}
