//
//  FeedTVC.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 10/30/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit
import Parse

class TradeEventsTVC: UITableViewController, EParseDelegate {
    let cellID = "Cell"
    var events: [PFObject] = []
    
    let eParse = EventParse.sharedInstance
    let iParse = ItemParse.sharedInstance
    
    var item: PFObject!
    var coll: PFObject!
    var loadingView: UIView!
    var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: "refresh", forControlEvents: .ValueChanged)
        self.refreshControl?.tintColor = UIColor(red: 210/255, green: 77/255, blue: 87/255, alpha: 1)

        
        configureLoading()
    }
    
    override func viewWillAppear(animated: Bool) {
        eParse.delegate = self
        eParse.getTradeEvents()
        loadingView.hidden = false
        activity.startAnimating()
    }
    
    func configureLoading() {
        loadingView = UIView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height-64))
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activity = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        activity.frame = loadingView.frame
        loadingView.addSubview(activity)
        loadingView.hidden = true
        self.view.addSubview(loadingView)
    }
    
    func refresh() {
        eParse.getTradeEvents()
        tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    func endRefresh() {
        loadingView.hidden = true
        activity.stopAnimating()
        tableView.reloadData()
    }
    
    // MARK: - Parse Delegate
    func didGetEvents(objs: [PFObject]) {
        events = objs
        endRefresh()
    }
    
    func didFinishWithError(msg: String) {
        print(msg)
        endRefresh()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View data source
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? EventCell
        // Configure the cell...
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("EventCell", owner: self, options: nil)[0] as? EventCell
        }
        
        cell?.event = events[indexPath.row]
        
        return cell!
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let event = events[indexPath.row]
        do {
            try event.fetchIfNeeded()
            item = event["item"] as! PFObject
            coll = event["collection"] as! PFObject
            self.performSegueWithIdentifier("itemSegue", sender: nil)
        }
        catch {
            print("Não fetchou o evento")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "itemSegue" {
            let vc = segue.destinationViewController as! UserItemVC
            vc.item = item
            vc.coll = coll
            vc.trade = true
        }
    }
    
}
