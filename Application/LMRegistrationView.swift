//
//  LMRegistrationView.swift
//  Application
//
//  Created by Dmitriy Groschovskiy on 6/13/16.
//  Copyright © 2016 Lerigos Urban Developers Limited. All rights reserved.
//

import UIKit
import Bolts
import Parse

class LMRegistrationView: UIViewController {
    
    @IBOutlet weak var username : UITextField!
    @IBOutlet weak var password : UITextField!
    @IBOutlet weak var firstName : UITextField!
    @IBOutlet weak var lastName : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func registerWithCredentials() {
        let customers = PFUser()
        customers.username = self.username.text
        customers.password = self.password.text
        customers.email = self.username.text
        customers["firstName"] = self.firstName.text
        customers["lastName"] = self.lastName.text
        
        customers.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                print(errorString)
            } else {
                // Hooray! Let them use the app now.
            }
        }
    }

}
