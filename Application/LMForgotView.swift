//
//  LMForgotView.swift
//  Application
//
//  Created by Dmitriy Groschovskiy on 6/13/16.
//  Copyright © 2016 Lerigos Urban Developers Limited. All rights reserved.
//

import UIKit
import Bolts
import Parse

class LMForgotView: UIViewController {
    
    @IBOutlet weak var username : UITextField!  

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func recoverWithCredentials(sender: UIButton) {
        PFUser.requestPasswordResetForEmailInBackground(username.text!)
    }

}
