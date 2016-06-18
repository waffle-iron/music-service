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

class LMWaterfall: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView : UIScrollView!
    @IBOutlet weak var tableView : UITableView!
    
    var waterfallLibrary : NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getWaterfallPlaylist()
        scrollView.scrollEnabled = true
        scrollView!.contentSize = CGSizeMake(770,145)
        
        tableView!.delegate = self
        tableView!.dataSource = self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getWaterfallPlaylist() {
        let queryWaterfall = PFQuery(className:"LMWaterfall")
        queryWaterfall.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                self.waterfallLibrary = objects as! NSArray
                self.tableView?.reloadData()
            } else {
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.waterfallLibrary.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseIdentifier = "cell"
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as UITableViewCell?
        if (cell != nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: reuseIdentifier)
        }
        
        cell!.textLabel?.text = String(self.waterfallLibrary.valueForKey("songName").objectAtIndex(indexPath.row))
        cell!.detailTextLabel?.text = String(self.waterfallLibrary.valueForKey("songArtist").objectAtIndex(indexPath.row))
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let streamingPlayer = LMOnePlayer()
        streamingPlayer.broadcastingStation = String(self.waterfallLibrary.valueForKey("songName").objectAtIndex(indexPath.row))
        streamingPlayer.broadcastingMetaInfo = String(self.waterfallLibrary.valueForKey("songArtist").objectAtIndex(indexPath.row))
        streamingPlayer.broadcastingURL = String(self.waterfallLibrary.valueForKey("songURL").objectAtIndex(indexPath.row))
        streamingPlayer.broadcastingObjectIdent = String(self.waterfallLibrary.valueForKey("objectId").objectAtIndex(indexPath.row))
        presentViewController(streamingPlayer, animated: true, completion: nil)
    }
    
}
