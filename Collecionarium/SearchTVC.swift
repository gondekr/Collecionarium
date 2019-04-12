//
//  SearchTVC.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 11/11/15.
//  Copyright © 2015 Gondek. All rights reserved.
//

import UIKit
import Parse

class SearchTVC: UITableViewController, UISearchBarDelegate, CParseDelegate {

    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var searchView: UIView!
    
    let cParse = CollectionParse.sharedInstance
    
    var collections: [PFObject] = []
    var loadingView: UIView!
    var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLoading()
    }
    
    override func viewWillAppear(animated: Bool) {
        cParse.delegate = self
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
    
    func endRefresh() {
        loadingView.hidden = true
        activity.stopAnimating()
        tableView.reloadData()
    }
    
    // MARK: - Parse Delegate
    func didGetCollections(objs: [PFObject]) {
        collections = objs
        endRefresh()
    }
    
    func didFinishWithError(msg: String) {
        print(msg)
        endRefresh()
    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        search.showsCancelButton = false
        search.resignFirstResponder()
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        search.showsCancelButton = true
        return true
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        cParse.getByName(searchBar.text!)
        
        search.showsCancelButton = false
        search.resignFirstResponder()
        loadingView.hidden = false
        activity.startAnimating()
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("searchCell", forIndexPath: indexPath)
        
        let obj = collections[indexPath.row]
        
        cell.textLabel?.text = obj["name"] as? String
        let user = obj["user"] as! PFObject
        do {
            try user.fetchIfNeeded()
            cell.detailTextLabel?.text = user["username"] as? String
        } catch {}
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "userCollection" {
            let view = segue.destinationViewController as! UserCollectionVC
            let index = tableView.indexPathForSelectedRow?.row
            view.userColl = collections[index!]
            view.user = collections[index!]["user"] as? PFObject
        }
    }
}
