//
//  LMCommingCloud.swift
//  Application
//
//  Created by Dmitriy Groschovskiy on 6/13/16.
//  Copyright © 2016 Lerigos Urban Developers Limited. All rights reserved.
//

import UIKit

class LMCommingCloud: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func showAlert(sender: UIButton) {
        let alertController = UIAlertController(title: "Lerigos Music", message: "You successful subscibed on notifications with weekly news from Lerigos Music community. After few months we gift for all subscribers 1 year of premium membership!", preferredStyle: .Alert)
        let closeController = UIAlertAction(title: "Close", style: .Cancel) { (action) in
            print("NSInfo: Constoller closed!")
            let musicPlayer = LMOnePlayer()
            self.presentViewController(musicPlayer, animated: true, completion: nil)
        }
        alertController.addAction(closeController)
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}
