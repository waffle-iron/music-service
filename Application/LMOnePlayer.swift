//
//  LMOnePlayer.swift
//  Application
//
//  Created by Dmitriy Groschovskiy on 6/13/16.
//  Copyright © 2016 Lerigos Urban Developers Limited. All rights reserved.
//

import UIKit

class LMOnePlayer: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func hideView(sender: UIButton) {
        self.view.viewWithTag(1)?.hidden = true
    }
    

}
