//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

@objc protocol NewFieldDelegate {
    @objc optional func fieldSaved(name: String, type: String, isTitle: Bool, index: Int)
}

class NewFieldTableView: UITableViewController {
    
    // MARK: Public API
    var fieldName : String!
    var fieldType : String!
    var index : Int!
    var isTitle: Bool!
    var nameCell: FieldNameCell?
    
    var delegate: NewFieldDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveField(sender: UIBarButtonItem) {
        if nameCell!.name.text == "" {
            let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: NSLocalizedString("FILL_INFO_NAME", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (al: UIAlertAction) -> Void in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            var check = false
            for index in 0..<dataTypes.count {
                let cell = tableView.cellForRow(at: IndexPath(row: index, section: 1))
                if cell?.accessoryType == .checkmark {
                    check = true
                    fieldType = dataTypes[index]
                }
            }
            let isTitle = (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! TitleFieldCell).sw.isOn
            if check {
                fieldName = nameCell!.name.text
                
                delegate?.fieldSaved!(name: fieldName, type: fieldType, isTitle: isTitle, index: index)

                self.navigationController?.popViewController(animated: true)
            }
            else {
                let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: NSLocalizedString("CHOOSE_INFO_TYPE", comment: ""), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        else {
            return dataTypes.count
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (section == 0 ? "" : NSLocalizedString("TYPE", comment: ""))
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            if indexPath.row == 0 {
//                if nameCell == nil {
//                    let cell = tableView.dequeueReusableCellWithIdentifier(reuseID.fieldName, forIndexPath: indexPath) as! FieldNameCell
//                    cell.name.text = fieldName
//                    nameCell = cell
//                }
//                return nameCell!
//            } else {
//                let cell = tableView.dequeueReusableCellWithIdentifier(reuseID.titleField, forIndexPath: indexPath) as! TitleFieldCell
//                cell.sw.on = isTitle
//                return cell
//            }
//        }
//        else {
//            let cell = tableView.dequeueReusableCellWithIdentifier(reuseID.fieldType, forIndexPath: indexPath) as! FieldTypeCell
//            cell.textLabel?.text = dataTitles[indexPath.row]
//            if dataTypes.indexOf(fieldType) != nil {
//                if (cell.textLabel?.text)! == dataTitles[dataTypes.indexOf(fieldType)!] {
//                    cell.accessoryType = .Checkmark
//                }
//            }
//            return cell
//        }

        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            for index in 0..<dataTypes.count {
                let cell = tableView.cellForRow(at: IndexPath(row: index, section: 1))
                cell?.accessoryType = .none
            }
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            fieldType = dataTypes[indexPath.row]
        }
    }
}
