//
//  Created by Rubens Gondek on 5/14/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol NewGroupVCInput {
    func displaySomething()
    func displayAlert(_ alert: UIAlertController)
}

protocol NewGroupVCOutput {
    func askForSomething()
}

class NewGroupVC: UIViewController {
    var output: NewGroupVCOutput!
    var router: NewGroupRouterInput!

    var baseGroup: GroupData!
    var fields: [FieldData] = []

    var selectedField: FieldData?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnChooseColor: UIButton!

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        NewGroupConfigurator.shared.configure(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupFields()
    }

    func registerCell() {
        let nib = UINib(nibName: FieldDetailsCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: FieldDetailsCell.identifier)
        let addNib = UINib(nibName: AddFieldCell.nibName, bundle: nil)
        tableView.register(addNib, forCellReuseIdentifier: AddFieldCell.identifier)
    }

    func setupFields() {
        fields = baseGroup.fields
        tableView.reloadData()
    }

    func updateColor() {
        let name = baseGroup.color
        btnChooseColor.backgroundColor = UIColor(named: name)
    }

    @IBAction func btnChooseColorPressed() {
        router.navigateToChooseColor()
    }
}

extension NewGroupVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = indexPath.row == fields.count ? AddFieldCell.identifier : FieldDetailsCell.identifier
        return tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
    }
}

extension NewGroupVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.row < fields.count,
            let fieldCell = cell as? FieldDetailsCell
            else { return }
        let field = fields[indexPath.row]
        fieldCell.setupField(data: field)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row < fields.count) {
            selectedField = fields[indexPath.row]
        }

        router.navigateToAddField()
    }
}

extension NewGroupVC: ChooseColorDelegate {
    func didSelectColor(_ color: String) {
        baseGroup.color = color
        updateColor()
    }
}

extension NewGroupVC: AddFieldDelegate {
    func didSaveField(_ field: FieldData) {
        let index = fields.firstIndex(where: { $0.id == field.id })
    }
}

extension NewGroupVC: NewGroupVCInput {
    func displaySomething() {
        // Use results
    }

    func displayAlert(_ alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
}
