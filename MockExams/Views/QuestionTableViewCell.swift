//
//  QuestionTableViewCell.swift
//  MockExams
//
//  Created by Dhaval on 15/07/19.
//  Copyright © 2019 Monarchy Infotech. All rights reserved.
//

import UIKit

class OptionTableViewCell: UITableViewCell {

    static let Identifier = "optionCell"
    
    @IBOutlet weak var optionInnerContainerView: UIView!
    @IBOutlet weak var optionContainerView: UIView!
    @IBOutlet weak var option: UILabel!
    
    var optionViewModel : OptionViewModel! {
        didSet {
            setOptionSelected(isSelected: false)
            option?.text = optionViewModel.description
        }
    }
    
    func setOptionSelected(isSelected : Bool) {
        if isSelected {
            optionInnerContainerView.layer.borderColor = UIColor.white.cgColor
            optionContainerView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
            option.textColor = .white
            option.font = Constants.FONTS.HELVETICAL_NEUE_BOLD.SIZE_19
        }
        else {
            optionInnerContainerView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
            optionContainerView.backgroundColor = .white
            option.textColor = .black
            option.font = Constants.FONTS.HELVETICAL_NEUE_REGULAR.SIZE_19
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
