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
    var selected: GroupData?

    @IBOutlet weak var tableView: UITableView!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        get { return .lightContent }
    }

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        GroupListConfigurator.shared.configure(viewController: self)
    }

    func registerCell() {
        let nib = UINib(nibName: GroupCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: GroupCell.identifier)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }

    override func viewWillAppear(_ animated: Bool) {
        output.askForGroups()
    }

    @IBAction func btnNewGroupPressed(_ sender: UIBarButtonItem) {
        router.navigateToGroupType()
    }

    @IBAction func btnEditPressed(_ sender: UIBarButtonItem) {
        isEditing = !isEditing
        tableView.setEditing(isEditing, animated: true)
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
        return tableView.dequeueReusableCell(withIdentifier: GroupCell.identifier, for: indexPath) as! GroupCell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let groupCell = cell as? GroupCell else { return }
        let group = items[indexPath.row]
        groupCell.setupGroup(group)
    }
}

extension GroupListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = items[indexPath.row]
        if (isEditing) {
            router.navigateToEditGroup()
            return
        }
    }
}

extension GroupListVC: GroupListVCInput {
    func displayGroups(_ groups: [GroupData]) {
        items = groups
        tableView.reloadData()
    }
}

