//
//  LMWaterfall.swift
//  Application
//
//  Created by Dmitriy Groschovskiy on 6/13/16.
//  Copyright © 2016 Lerigos Urban Developers Limited. All rights reserved.
//

import UIKit
import Bolts
import Parse

class LMWaterfall: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.getWaterfallPlaylist()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func getWaterfallPlaylist() {
        let queryWaterfall = PFQuery(className:"LMWaterfall")
        queryWaterfall.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                print("Successfully retrieved \(objects!.count) music track identificators.")
                if let objects = objects {
                    for object in objects {
                        print(object.objectId)
                    }
                }
            } else {
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }

}
