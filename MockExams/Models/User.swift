//
//  User.swift
//  MockExams
//
//  Created by Dhaval on 29/07/19.
//  Copyright © 2019 Monarchy Infotech. All rights reserved.
//

import UIKit
import Alamofire

struct User: Codable {
    var firstName : String!
    var lastName : String!
    var email : String!
    var password : String!
    var authToken : String!
    var refreshToken : String!
    
    func registerNewUser(firstName : String,
                         lastName : String,
                         email : String,
                         password : String,
                         successBlock :@escaping () -> (),
                         errorBlock :@escaping (_ error : String) -> ()) {
        
        let parameters = [
            "firstName" : firstName,
            "lastName" : lastName,
            "email" : email,
            "password" : password
        ]
        
        Alamofire.request(Constants.SERVICES.REGISTER_NEW_USER, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { (response: DataResponse) in
                
                switch response.result {
                case .success(let json):
                    
                    if var jsonData = json as? [String: AnyObject] {
                        print("initiatePayment response : \(jsonData)")
                        
                        do {
                            
                            jsonData = jsonData["data"] as! [String: AnyObject]
                            let data = try JSONSerialization.data(withJSONObject: jsonData, options: [])
                            
                            let jsonDecoder = JSONDecoder()
                            let user = try jsonDecoder.decode(User.self, from: data)
                            
                            print("initiatePayment response : \(jsonData)")
                            
                            successBlock()
                        }
                        catch {
                            errorBlock(error.localizedDescription)
                        }
                        
                    }
                    else {
                        errorBlock("Something went wrong!!!")
                    }
                    
                case .failure(let error):
                    print("initiatePayment error : \(error)")
                    errorBlock(error.localizedDescription)
                    
                    break
                }
        }
    }
    
    func login(email : String, password : String,
               successBlock :@escaping () -> (),
               errorBlock :@escaping (_ error : String) -> ()) {
        
        let parameters = [
            "email" : email,
            "password" : password
        ]
        
        Alamofire.request(Constants.SERVICES.LOGIN, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { (response: DataResponse) in
                
                switch response.result {
                case .success(let json):
                    
                    if var jsonData = json as? [String: AnyObject] {
                        print("initiatePayment response : \(jsonData)")
                        
                        
                        do {
                            jsonData = jsonData["data"] as! [String: AnyObject]
                            
                            let data = try JSONSerialization.data(withJSONObject: jsonData, options: [])
                            
                            let jsonDecoder = JSONDecoder()
                            let user = try jsonDecoder.decode(User.self, from: data)
                            
                            print("initiatePayment response : \(jsonData)")
                            
                            successBlock()
                        }
                        catch {
                            errorBlock(error.localizedDescription)
                        }
                        
                    }
                    else {
                        errorBlock("Something went wrong!!!")
                    }
                    
                case .failure(let error):
                    print("initiatePayment error : \(error)")
                    errorBlock(error.localizedDescription)
                    
                    break
                }
        }
    }
}
