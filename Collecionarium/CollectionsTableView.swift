//
//  CollectionsTableView.swift
//  BigApp
//
//  Created by Rubens Gondek on 8/27/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit
import Parse

enum CollectionSource {
    case Local
    case Cloud
}

class CollectionsTableView: UITableViewController, CParseDelegate {
    
    @IBOutlet weak var editBtn: UIBarButtonItem!
    
    var localColls: [Collection]!
    var cloudColls: [PFObject]! = []
    var cloudCont: [Int] = []
    let cManager = CollectionManager.sharedInstance
    let cParse = CollectionParse.sharedInstance
    var tutoView: UIView!
    var loadingView: UIView!
    var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tutoView = Tutorial(frame: CGRectMake(0, 0, tableView.frame.width, tableView.frame.height-64), type: .Collection)
        self.refreshControl?.addTarget(self, action: "refresh", forControlEvents: .ValueChanged)
        self.refreshControl?.tintColor = UIColor(red: 210/255, green: 77/255, blue: 87/255, alpha: 1)

        
        configureLoading()
    }
    
    override func viewWillAppear(animated: Bool) {
        cParse.delegate = self
        loadTable()
        loadingView.hidden = false
        activity.startAnimating()
    }
    
    func refresh() {
        loadTable()
    }
    
    func endRefresh() {
        self.refreshControl?.endRefreshing()
        loadingView.hidden = true
        activity.stopAnimating()
        noCollection()
    }
    
    func loadTable() {
        localColls = cManager.fetchCollections()
        cParse.getAllByUser(ParseUser.sharedInstance.user!)
        
        if editBtn.tag == 1 {
            switchEdit()
        }
    }
    
    // MARK: - Parse Delegate
    func didGetCollections(objs: [PFObject], count: [Int]) {
        cloudColls = objs
        cloudCont = count
        tableView.reloadData()
        endRefresh()
    }
    
    func didFinishWithError(msg: String) {
        print(msg)
        endRefresh()
    }
    
    func configureLoading() {
        loadingView = UIView(frame: CGRectMake(0, 0, tableView.frame.width, tableView.frame.height-64))
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activity = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        activity.frame = loadingView.frame
        loadingView.addSubview(activity)
        loadingView.hidden = true
        self.tableView.addSubview(loadingView)
    }
    
    func noCollection() {
        if !self.view.subviews.contains(tutoView) {
            if localColls.isEmpty && cloudColls.isEmpty {
                self.tableView.scrollEnabled = false
                self.view.addSubview(tutoView)
            }
        }
        else {
            if !localColls.isEmpty || !cloudColls.isEmpty {
                self.tableView.scrollEnabled = true
                tutoView.removeFromSuperview()
            }
        }
    }
    
    func switchEdit(){
        if editBtn.tag == 0 {
            if localColls.count != 0 || cloudColls.count != 0 {
                editBtn.title = NSLocalizedString("DONE", comment: "")
                editBtn.style = .Done
                tableView.editing = true
                editBtn.tag = 1
            }
        }
        else {
            editBtn.title = NSLocalizedString("EDIT", comment: "")
            editBtn.style = .Plain
            tableView.editing = false
            editBtn.tag = 0
        }
    }
    
    @IBAction func editColl(sender: AnyObject) {
        switchEdit()
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0 ? cloudColls.count : localColls.count)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (section == 0 ? "Cloud" : "Local")
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier("CloudCollectionCell", forIndexPath: indexPath)
            cell.textLabel?.text = cloudColls[indexPath.row]["name"] as? String
            cell.detailTextLabel?.text = "\(cloudCont[indexPath.row]) " + NSLocalizedString("ITEMS", comment: "")
        }
        else {
            cell = tableView.dequeueReusableCellWithIdentifier("LocalCollectionCell", forIndexPath: indexPath)
            cell.textLabel?.text = localColls[indexPath.row].name
            cell.detailTextLabel?.text = "\(localColls[indexPath.row].items.count) " + NSLocalizedString("ITEMS", comment: "")
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView.editing {
            performSegueWithIdentifier("EditCollection", sender: nil)
        }
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            if indexPath.section == 0 {
                cParse.deleteCollection(cloudColls[indexPath.row])
                cloudColls.removeAtIndex(indexPath.row)
            }
            else {
                cManager.deleteCollection(localColls[indexPath.row])
                localColls.removeAtIndex(indexPath.row)
            }
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            noCollection()
        }
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "cloudItemSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let coll = cloudColls[indexPath.row]
                let items = segue.destinationViewController as! ItemsCollectionView
                items.cloudColl = coll
            }
        }
        else if segue.identifier == "localItemSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let coll = localColls[indexPath.row]
                let items = segue.destinationViewController as! ItemsCollectionView
                items.localColl = coll
            }
        }
        else if segue.identifier == "EditCollection" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                if indexPath.section == 0 {
                    let coll = cloudColls[indexPath.row]
                    let editView = segue.destinationViewController as! NewCollectionTableView
                    editView.cloudColl = coll
                } else {
                    let coll = localColls[indexPath.row]
                    let editView = segue.destinationViewController as! NewCollectionTableView
                    editView.localColl = coll
                }
            }
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if tableView.editing {
            if identifier == "localItemSegue" || identifier == "cloudItemSegue" {
                return false
            }
        }
        return true
    }
    
}
