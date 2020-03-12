//
//  Created by Rubens Gondek on 5/20/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol AddFieldDelegate {
    func didSaveField(_ field: FieldData)
}

class AddFieldVC: UIViewController {
    var router: AddFieldRouterInput!

    var field: FieldData?
    var fieldId: String = ""
    var selectedType: DataType = .string

    var delegate: AddFieldDelegate?

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var btnType: UIButton!
    @IBOutlet weak var swTitle: UISwitch!

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        AddFieldConfigurator.shared.configure(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupField()
    }

    func setupField() {
        guard let initial = field else { return }
        txtName.text = initial.name
        swTitle.isOn = initial.isTitle
        selectedType = initial.type
        updateType()
    }

    func updateType() {
        let type = selectedType.rawValue.localized()
        btnType.setTitle(type, for: .normal)
    }

    @IBAction func btnTypePressed() {
        router.chooseType()
    }

    @IBAction func btnSavePressed(_ sender: UIBarButtonItem) {
        guard let name = txtName.text else { return }
        let isTitle = swTitle.isOn
        let fieldToSave = FieldData(id: fieldId, name: name, type: selectedType, isTitle: isTitle)
        delegate?.didSaveField(fieldToSave)
        router.goBack()
    }
}

extension AddFieldVC: CustomPickerDelegate {
    func didPickItem(_ item: String) {
        selectedType = DataType(rawValue: item) ?? .string
        updateType()
    }
}
