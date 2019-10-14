//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class NewsTVC: UITableViewController {
    let cellID = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.refreshControl?.tintColor = UIColor(red: 210/255, green: 77/255, blue: 87/255, alpha: 1)
        
//        configureLoading()
    }

    @objc func refresh() {
        tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    func endRefresh() {
        tableView.reloadData()
    }

    // MARK: - Table View data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
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

    }
}
