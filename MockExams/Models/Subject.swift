//
//  Subject.swift
//  MockExams
//
//  Created by Dhaval on 21/06/19.
//  Copyright © 2019 Monarchy Infotech. All rights reserved.
//

import Foundation
import Alamofire
import iLoader

struct Subject: Codable {
    var subject : String!
    var questions : [Question]!
    var createdOn : Date!
    var lastUpdatedOn : Date!
    
    func fetchSubjects(successBlock :@escaping (_ subjects : [Subject]) -> (),
                       errorBlock :@escaping (_ error : String) -> ()) {
        
        iLoader.shared.show()
        
        Alamofire.request(Constants.SERVICES.GET_SUBJECTS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { (response: DataResponse) in
                
                switch response.result {
                case .success(let json):

                    if var jsonData = json as? [String: AnyObject] {
                        print("initiatePayment response : \(jsonData)")
                        
                        do {
                            let subjectsJsonArray = jsonData["data"] as! [[String: AnyObject]]
                            
                            var subjects = [Subject]()
                            
                            for subjectJson in subjectsJsonArray {
                                let subjectData = try JSONSerialization.data(withJSONObject: subjectJson, options: [])
                                
                                let jsonDecoder = JSONDecoder()
                                
                                let subject = try jsonDecoder.decode(Subject.self, from: subjectData)
                                
                                subjects.append(subject)

                            }

                            successBlock(subjects)

                        }
                        catch {
                            errorBlock(error.localizedDescription)
                        }
                        
                        iLoader.shared.hide()
                    }
                    else {
                        errorBlock("Something went wrong!!!")
                        iLoader.shared.hide()
                    }
                    
                case .failure(let error):
                    print("initiatePayment error : \(error)")
                    errorBlock(error.localizedDescription)
                    iLoader.shared.hide()
                    
                    break
                }
                
        }
    }
}


