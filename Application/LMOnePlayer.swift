//
//  LMOnePlayer.swift
//  Application
//
//  Created by Dmitriy Groschovskiy on 6/13/16.
//  Copyright © 2016 Lerigos Urban Developers Limited. All rights reserved.
//

import UIKit
import Bolts
import Parse

import Social

class LMOnePlayer: UIViewController {
    
    @IBOutlet weak var stationArtwork : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Backend functionality for mobile application

    @IBAction func likeMusicStation(sender: UIButton) {
        
    }
    
    @IBAction func playingBroadcastStatus(sender: UIButton) {
        
    }
    
    @IBAction func shareMusicStation(sender: UIButton) {
        let twitterView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        twitterView.setInitialText("SIISISISIs")
        twitterView.addImage(stationArtwork.image!)
        twitterView.addURL(NSURL(string: "https://music.lerigos.co"))
        self.presentViewController(twitterView, animated: true, completion: nil)
    }

}
