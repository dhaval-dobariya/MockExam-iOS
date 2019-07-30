//
//  MultiLineTextDemoViewController.swift
//  MockExams
//
//  Created by Dhaval on 23/07/19.
//  Copyright © 2019 Monarchy Infotech. All rights reserved.
//

import UIKit

struct SampleText {
    let title : String
    let description : String
    
    init(title : String, description : String) {
        self.title = title
        self.description = description
    }
}

class LargeTextCell: UITableViewCell {
    static let identifier = "largeTextCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var termsLabel: UILabel!

}

class MultiLineTextDemoViewController: UIViewController {

    var sampleTexts = [SampleText]()
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sampleTexts.append(SampleText(title: "Title 1", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."))
        sampleTexts.append(SampleText(title: "Title 2", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."))
        sampleTexts.append(SampleText(title: "Title 3", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."))

        tableview.reloadData()
        
//        tableview.estimatedRowHeight = 100
//        tableview.rowHeight = UITableView.automaticDimension

    }
    


}

extension MultiLineTextDemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LargeTextCell.identifier, for: indexPath) as! LargeTextCell
        let sample = sampleTexts[indexPath.row]
        
        cell.titleLabel.text = sample.title
        cell.descriptionLabel.text = sample.description
        cell.termsLabel.text = sample.description

        return cell
    }
    
    
}

extension MultiLineTextDemoViewController: UITableViewDelegate {
    
}

