//
//  Created by Rubens Gondek on 5/14/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol NewGroupVCInput {
    func displaySuccess(_ success: Bool)
    func displayAlert(_ alert: UIAlertController)
}

protocol NewGroupVCOutput {
    func askForGroupSave(_ group: GroupData)
}

class NewGroupVC: UIViewController {
    var output: NewGroupVCOutput!
    var router: NewGroupRouterInput!

    var baseGroup: GroupData!
    var fields: [FieldData] = []

    var selectedField: FieldData?

    @IBOutlet weak var header: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var btnChooseColor: UIButton!

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        NewGroupConfigurator.shared.configure(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupHeader()
    }

    override func viewWillLayoutSubviews() {
        setupInitial()
    }

    func registerCell() {
        let nib = UINib(nibName: FieldDetailsCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: FieldDetailsCell.identifier)
        let addNib = UINib(nibName: AddFieldCell.nibName, bundle: nil)
        tableView.register(addNib, forCellReuseIdentifier: AddFieldCell.identifier)
    }

    func setupInitial() {
        txtName.text = baseGroup.name
        setupFields()
        updateColor()
    }

    func setupFields() {
        fields = baseGroup.fields
        tableView.reloadData()
    }

    func setupHeader() {
        tableView.tableHeaderView = header
    }

    func updateColor() {
        let name = baseGroup.color
        guard let color = UIColor(named: name) else {
            baseGroup.color = "Orange"
            updateColor()
            return
        }

        btnChooseColor.backgroundColor = color
    }

    @IBAction func btnChooseColorPressed() {
        router.navigateToChooseColor()
    }

    @IBAction func btnSavePressed(_ sender: UIBarButtonItem) {
        baseGroup.fields = fields
        if let name = txtName.text { baseGroup.name = name }
        output.askForGroupSave(baseGroup)
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
        let id = getCellId(row: indexPath.row)
        return tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
    }

    func getCellId(row: Int) -> String {
        switch row {
        case fields.count:
            return AddFieldCell.identifier
        default:
            return FieldDetailsCell.identifier
        }
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
        if indexPath.row < fields.count {
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
        if field.isTitle {
            fields = fields.map {
                var item = $0
                item.isTitle = false
                return item
            }
            tableView.reloadData()
        }

        guard let index = fields.firstIndex(where: { $0.id == field.id }) else {
            fields.append(field)
            tableView.reloadData()
            return
        }

        fields[index] = field
        tableView.reloadData()
    }
}

extension NewGroupVC: NewGroupVCInput {
    func displaySuccess(_ success: Bool) {
        if success { router.navigateToHome() }
    }

    func displayAlert(_ alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
}
