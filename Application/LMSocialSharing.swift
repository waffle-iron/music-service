//
//  LMSocialSharing.swift
//  Application
//
//  Created by Dmitriy Groschovskiy on 6/16/16.
//  Copyright © 2016 Lerigos Urban Developers Limited. All rights reserved.
//

import UIKit
import Social
import Accounts

class LMSocialSharing: UIViewController {
    
    func twitterSharing(postMessage: String, postArtwork: UIImageView) {
        let twitterView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        twitterView.setInitialText(postMessage)
        twitterView.addImage(postArtwork.image!)
        twitterView.addURL(NSURL(string: "https://music.lerigos.co"))
        self.presentViewController(twitterView, animated: true, completion: nil)
    }
    
    func facebookSharing(postMessage: String, postArtwork: UIImageView) {
        let facebookView = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        facebookView.setInitialText(postMessage)
        facebookView.addImage(postArtwork.image!)
        facebookView.addURL(NSURL(string: "https://music.lerigos.co"))
        presentViewController(facebookView, animated: true, completion: nil)
    }
    
    func vkontakteSharing(postMessage: String, postArtwork: UIImageView) {
        
    }

}
