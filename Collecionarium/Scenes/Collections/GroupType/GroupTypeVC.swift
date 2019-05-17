//
//  Created by Rubens Gondek on 5/16/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol GroupTypeVCInput {
    func displayTypes(_ types: [GroupData])
    func displayAlert(_ alert: UIAlertController)
}

protocol GroupTypeVCOutput {
    func askForTypes()
}

class GroupTypeVC: UIViewController {
    var output: GroupTypeVCOutput!
    var router: GroupTypeRouter!

    var items: [GroupData] = []

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        output.askForTypes()
        registerCell()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        GroupTypeConfigurator.shared.configure(viewController: self)
    }

    private func registerCell() {
        let nib = UINib(nibName: GroupTypeCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: GroupTypeCell.identifier)
    }
}

extension GroupTypeVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: GroupTypeCell.identifier, for: indexPath)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let typeCell = cell as? GroupTypeCell else { return }
        let type = items[indexPath.row]
        typeCell.setGroup(data: type)
    }
}

extension GroupTypeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(items[indexPath.row])
    }
}

extension GroupTypeVC: GroupTypeVCInput {
    func displayAlert(_ alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }

    func displayTypes(_ types: [GroupData]) {
        items = types
        tableView.reloadData()
    }
}

