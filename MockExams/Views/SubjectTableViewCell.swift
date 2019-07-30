//
//  SubjectTableViewCell.swift
//  MockExams
//
//  Created by Dhaval on 28/06/19.
//  Copyright © 2019 Monarchy Infotech. All rights reserved.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {
    
    static let Identifier = "subjectCell"
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var details: UILabel!
    
    var subjectViewModel : SubjectViewModel! {
        didSet {
            title.text = subjectViewModel.name
            details.text = subjectViewModel.detailText
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
