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
import SwiftHTTP
import AVFoundation

class LMOnePlayer: UIViewController {
    
    @IBOutlet weak var stationName : UILabel!
    @IBOutlet weak var stationMeta : UILabel!
    @IBOutlet weak var stationLikes : UILabel!
    @IBOutlet weak var stationArtwork : UIImageView!
    
    var streamingPlayer : AVPlayer!
    var broadcastingURL = String()
    var broadcastingStation = String()
    var broadcastingMetaInfo = String()
    var broadcastingObjectIdent = String()
    var broadcastingArtworkImage = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stationName.text = broadcastingStation
        stationMeta.text = broadcastingMetaInfo
        
        self.thirdPartyModules()
        self.broadcastMediaInformation()
        self.getCustomerLike()
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
        //twitterView.addImage(stationArtwork.image!)
        twitterView.addURL(NSURL(string: "https://music.lerigos.co"))
        self.presentViewController(twitterView, animated: true, completion: nil)
    }
    
    
    @IBAction func broadcastStatusEvent(sender: UIButton) {
        if ((streamingPlayer.rate != 0) && (streamingPlayer.error == nil)) {
            streamingPlayer.pause()
        } else if ((streamingPlayer.rate == 0) && (streamingPlayer.error == nil)) {
            streamingPlayer.play()
        }
    }
    
    func thirdPartyModules() {
        let gestureState = UISwipeGestureRecognizer(target: self, action: "closeController:")
        gestureState.direction = .Down
        view.addGestureRecognizer(gestureState)
    }
    
    func closeController(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    internal func broadcastMediaInformation() {
        let broadcastURL = NSURL(string: broadcastingURL)
        streamingPlayer = AVPlayer(URL: broadcastURL!)
        streamingPlayer.play()
    }
    
    func getCustomerLike() {
        let likeInterface = PFQuery(className:"LMStations")
        likeInterface.getObjectInBackgroundWithId(self.broadcastingObjectIdent) {
            (likeCount: PFObject?, error: NSError?) -> Void in
            if error == nil && likeCount != nil {
                self.stationLikes.text = String(likeCount!["stationLikes"])
            } else {
                print(error)
            }
        }
    }
    
    @IBAction func increaseCustomerLike(sender: UIButton) {
        do {
            let opt = try HTTP.GET("https://lerigos-api.appspot.com/api/station/\(broadcastingObjectIdent)")
            opt.start { response in
                if let err = response.error {
                    print("error: \(err.localizedDescription)")
                    return
                }
                print("opt finished: \(response.description)")
                self.getCustomerLike()
            }
        } catch let error {
            print("got an error creating the request: \(error)")
        }
    }
    
    @IBAction func sharingCustomerMusic(sender: UIButton) {
        let optionMenu = UIAlertController(title: "Lerigos Music Society of Sound", message: "Share your music with your friends and get feedback via social networks or Lerigos Connect.", preferredStyle: .ActionSheet)
        
        let facebookShare = UIAlertAction(title: "Share on Facebook", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
                let facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                facebookSheet.setInitialText("self.I'm now listen \(self.broadcastingMetaInfo) self.on \(self.broadcastingStation) via #lerigosMusic")
                self.presentViewController(facebookSheet, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        })
        
        let twitterShare = UIAlertAction(title: "Share on Twitter", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
                let twitterSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                twitterSheet.setInitialText("I'm now listen \(self.broadcastingMetaInfo) on \(self.broadcastingStation) via @lerigos_music")
                self.presentViewController(twitterSheet, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to share.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        })
        
        let vkontakteShare = UIAlertAction(title: "Share on Vkontakte", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("File Saved")
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            
        })
        
        optionMenu.addAction(facebookShare)
        optionMenu.addAction(twitterShare)
        optionMenu.addAction(vkontakteShare)
        optionMenu.addAction(cancelAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }

}
