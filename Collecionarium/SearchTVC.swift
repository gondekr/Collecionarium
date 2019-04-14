//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class SearchTVC: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var searchView: UIView!

    var loadingView: UIView!
    var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLoading()
    }
    
    func configureLoading() {
        loadingView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height-64))
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activity = UIActivityIndicatorView(style: .whiteLarge)
        activity.frame = loadingView.frame
        loadingView.addSubview(activity)
        loadingView.isHidden = true
        self.tableView.addSubview(loadingView)
    }
    
    func endRefresh() {
        loadingView.isHidden = true
        activity.stopAnimating()
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search.showsCancelButton = false
        search.resignFirstResponder()
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        search.showsCancelButton = true
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search.showsCancelButton = false
        search.resignFirstResponder()
        loadingView.isHidden = false
        activity.startAnimating()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath)
        
//        cell.textLabel?.text = obj["name"] as? String
//        let user = obj["user"] as! PFObject
//        do {
//            try user.fetchIfNeeded()
//            cell.detailTextLabel?.text = user["username"] as? String
//        } catch {}
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userCollection" {
            let view = segue.destination as! UserCollectionVC
            let index = tableView.indexPathForSelectedRow?.row
        }
    }
}
