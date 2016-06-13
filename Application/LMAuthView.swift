//
//  LMAuthView.swift
//  Application
//
//  Created by Dmitriy Groschovskiy on 6/13/16.
//  Copyright © 2016 Lerigos Urban Developers Limited. All rights reserved.
//

import UIKit
import Bolts
import Parse

class LMAuthView: UIViewController {
    
    @IBOutlet weak var username : UITextField!
    @IBOutlet weak var password : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func authWithCredentials(sender: UIButton) {
        PFUser.logInWithUsernameInBackground(username.text!, password: password.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Do stuff after successful login.
            } else {
                let alertController = UIAlertController(title: "Invalid Credentials", message: "Opps. Your password or username is incorrect. Please try again or use method bellow. Thank you!", preferredStyle: .Alert)
                
                let firstAction = UIAlertAction(title: "Okay", style: .Default) { (action) in
                }
                alertController.addAction(firstAction)
                
                let secondAction = UIAlertAction(title: "Recover", style: .Default) { (action) in
                    let credentialsRecoveryController = LMForgotView()
                    self.presentViewController(credentialsRecoveryController, animated: true, completion: nil)
                }
                alertController.addAction(secondAction)
                
                self.presentViewController(alertController, animated: true) { "..." }
            }
        }
    }
    
    @IBAction func registrationController(sender: UIButton) {
        let registrationController = LMRegistrationView()
        self.presentViewController(registrationController, animated: true, completion: nil)
    }
    
    @IBAction func closeController(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
