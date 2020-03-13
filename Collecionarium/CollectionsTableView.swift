//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class CollectionsTableView: UITableViewController {
    @IBOutlet weak var editBtn: UIBarButtonItem!
    
//    var localColls: [Collection]!
    var cloudCont: [Int] = []
    let cManager = CollectionManager.sharedInstance
    var tutoView: UIView!
    var loadingView: UIView!
    var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tutoView = Tutorial(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height-64), type: .Collection)
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.refreshControl?.tintColor = UIColor(red: 210/255, green: 77/255, blue: 87/255, alpha: 1)
        
        configureLoading()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadTable()
        loadingView.isHidden = false
        activity.startAnimating()
    }
    
    @objc func refresh() {
        loadTable()
    }
    
    func endRefresh() {
        self.refreshControl?.endRefreshing()
        loadingView.isHidden = true
        activity.stopAnimating()
        noCollection()
    }
    
    func loadTable() {
//        localColls = cManager.fetchCollections()

        if editBtn.tag == 1 {
            switchEdit()
        }
    }
    
    func configureLoading() {
//        loadingView = UIView(frame: CGRect(0, 0, tableView.frame.width, tableView.frame.height-64))
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activity = UIActivityIndicatorView(style: .large)
        activity.frame = loadingView.frame
        loadingView.addSubview(activity)
        loadingView.isHidden = true
//        self.tableView.addSubview(loadingView)
    }
    
    func noCollection() {
//        if !self.view.subviews.contains(tutoView) {
//            if localColls.isEmpty && cloudColls.isEmpty {
//                self.tableView.scrollEnabled = false
//                self.view.addSubview(tutoView)
//            }
//        }
//        else {
//            if !localColls.isEmpty || !cloudColls.isEmpty {
//                self.tableView.scrollEnabled = true
//                tutoView.removeFromSuperview()
//            }
//        }
    }
    
    func switchEdit(){
//        if editBtn.tag == 0 {
//            if localColls.count != 0 || cloudColls.count != 0 {
//                editBtn.title = NSLocalizedString("DONE", comment: "")
//                editBtn.style = .Done
//                tableView.editing = true
//                editBtn.tag = 1
//            }
//        }
//        else {
//            editBtn.title = NSLocalizedString("EDIT", comment: "")
//            editBtn.style = .Plain
//            tableView.editing = false
//            editBtn.tag = 0
//        }
    }
    
    @IBAction func editColl(sender: AnyObject) {
        switchEdit()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        var cell: UITableViewCell
        //        if indexPath.section == 0 {
        //            cell = tableView.dequeueReusableCellWithIdentifier("CloudCollectionCell", forIndexPath: indexPath)
        //            cell.textLabel?.text = cloudColls[indexPath.row]["name"] as? String
        //            cell.detailTextLabel?.text = "\(cloudCont[indexPath.row]) " + NSLocalizedString("ITEMS", comment: "")
        //        }
        //        else {
        //            cell = tableView.dequeueReusableCellWithIdentifier("LocalCollectionCell", forIndexPath: indexPath)
        //            cell.textLabel?.text = localColls[indexPath.row].name
        //            cell.detailTextLabel?.text = "\(localColls[indexPath.row].items.count) " + NSLocalizedString("ITEMS", comment: "")
        //        }
        //
        return UITableViewCell()
    }
}
