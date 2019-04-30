//
//  Created by Rubens Gondek on 4/28/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupListVCInput {
    func displayGroups(_ groups: [GroupData])
}

protocol GroupListVCOutput {
    func askForGroups()
}

class GroupListVC: UIViewController {
    var output: GroupListVCOutput!
    var router: GroupListRouter!

    var items = [GroupData]()
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        GroupListConfigurator.shared.configure(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.askForGroups()
    }
}

extension GroupListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension GroupListVC: GroupListVCInput {
    func displayGroups(_ groups: [GroupData]) {
        items = groups
        tableView.reloadData()
    }
}

