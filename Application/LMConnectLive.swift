//
//  LMConnectLive.swift
//  Application
//
//  Created by Dmitriy Groschovskiy on 6/16/16.
//  Copyright © 2016 Lerigos Urban Developers Limited. All rights reserved.
//

import UIKit
import Bolts
import Parse

class LMConnectLive: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func checkUserAuthentification() {
        let currentUser = PFUser.currentUser()
        if currentUser != nil {
            // Do stuff with the user
        } else {
            let authScreen = LMAuthView()
            self.presentViewController(authScreen, animated: true, completion: nil)
        }
    }

}
