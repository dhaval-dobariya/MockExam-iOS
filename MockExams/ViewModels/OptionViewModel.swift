//
//  OptionViewModel.swift
//  MockExams
//
//  Created by Dhaval on 18/07/19.
//  Copyright © 2019 Monarchy Infotech. All rights reserved.
//

class OptionViewModel {
    let index : Int
    let description : String

    
    init(option : Option) {
        
        self.index       = option.index
        self.description = option.option
        
    }
}
