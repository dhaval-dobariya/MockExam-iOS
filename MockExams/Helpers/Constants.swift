//
//  Constants.swift
//  MockExams
//
//  Created by Dhaval on 22/07/19.
//  Copyright © 2019 Monarchy Infotech. All rights reserved.
//

import UIKit

class Constants: NSObject {

    struct SERVICES {
//        static let WEBSITE_URL              = "https://mock-exam.herokuapp.com/"
        
//        static let HOST_DOMAIN              = "mock-exam.herokuapp.com"
        static let SERVICE_URL                  = "https://mock-exam.herokuapp.com/"
        
        static let REGISTER_NEW_USER            = SERVICE_URL + "newUserSignUp"
        static let LOGIN                        = SERVICE_URL + "login"

        static let GET_SUBJECTS                 = SERVICE_URL + "subject"
        

    }
    
    struct FONTS {
        
        struct HELVETICAL_NEUE_REGULAR {
            static let SIZE_19 = UIFont(name: "HelveticaNeue", size: 19)
            static let SIZE_25 = UIFont(name: "HelveticaNeue", size: 25)
        }
        
        struct HELVETICAL_NEUE_MEDIUM {
            static let SIZE_14 = UIFont(name: "HelveticaNeue-Medium", size: 14)
            static let SIZE_18 = UIFont(name: "HelveticaNeue-Medium", size: 18)
        }
        
        struct HELVETICAL_NEUE_BOLD {
            static let SIZE_19 = UIFont(name: "HelveticaNeue-Bold", size: 19)
            static let SIZE_25 = UIFont(name: "HelveticaNeue-Bold", size: 25)
        }
    }
}
