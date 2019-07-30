//
//  Utilities.swift
//  MockExams
//
//  Created by Dhaval on 30/07/19.
//  Copyright © 2019 Monarchy Infotech. All rights reserved.
//

import UIKit

class Utilities: NSObject {

    //MARK: Show Alert
    class func showAlert(strTitle:String, strMessage:String?, parent:AnyObject, OKButtonTitle : String? ,CancelButtonTitle : String?, okBlock : (() -> Void)?, cancelBlock : (() -> Void)?)
    {
        let alert = UIAlertController(title: strTitle, message: (strMessage ?? ""), preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: (OKButtonTitle ?? "Ok"), style: .default) { (action:UIAlertAction!) in
            if (okBlock != nil) {
                okBlock!()
            }
        }
        alert.addAction(OKAction)
        
        if CancelButtonTitle != nil {
            let CancelAction = UIAlertAction(title: CancelButtonTitle, style: .default) { (action:UIAlertAction!) in
                if (cancelBlock != nil) {
                    cancelBlock!()
                }
            }
            alert.addAction(CancelAction)
        }
        
        parent.present(alert, animated: true, completion: nil)
        
    }
}
