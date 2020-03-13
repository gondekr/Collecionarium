//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class TradeEventsTVC: UITableViewController {
    let cellID = "Cell"
    
    var loadingView: UIView!
    var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.refreshControl?.tintColor = UIColor(red: 210/255, green: 77/255, blue: 87/255, alpha: 1)

        
        configureLoading()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadingView.isHidden = false
        activity.startAnimating()
    }
    
    func configureLoading() {
        loadingView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height-64))
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activity = UIActivityIndicatorView(style: .large)
        activity.frame = loadingView.frame
        loadingView.addSubview(activity)
        loadingView.isHidden = true
        self.view.addSubview(loadingView)
    }
    
    @objc func refresh() {
        tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    func endRefresh() {
        loadingView.isHidden = true
        activity.stopAnimating()
        tableView.reloadData()
    }

    // MARK: - Table View data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? EventCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("EventCell", owner: self, options: nil)?[0] as? EventCell
        }
        
        return cell!
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let event = events[indexPath.row]
//        do {
//            try event.fetchIfNeeded()
//            item = event["item"] as! PFObject
//            coll = event["collection"] as! PFObject
//            self.performSegueWithIdentifier("itemSegue", sender: nil)
//        }
//        catch {
//            print("Não fetchou o evento")
//        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "itemSegue" {
//            let vc = segue.destinationViewController as! UserItemVC
//            vc.item = item
//            vc.coll = coll
//            vc.trade = true
//        }
    }
}
