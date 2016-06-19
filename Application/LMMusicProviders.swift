//
//  LMMusicProviders.swift
//  Application
//
//  Created by Dmitriy Groschovskiy on 6/19/16.
//  Copyright © 2016 Lerigos Urban Developers Limited. All rights reserved.
//

import UIKit
import SwiftyVK

class LMMusicProviders: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView : UITableView!
    
    var SCOPE : Array = ["user", "audio"];

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addMusicProvider(sender: UIBarButtonItem) {
        //VK.start(appID: "5214070", delegate: VKDelegate.vkWillAutorize(SCOPE))
        VK.autorize()
    }
    

}
