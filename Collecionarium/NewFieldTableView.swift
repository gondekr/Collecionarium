//
//  NewFieldTableView.swift
//  BigApp
//
//  Created by Rubens Gondek on 9/4/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit

@objc protocol NewFieldDelegate {
    optional func fieldSaved(name: String, type: String, isTitle: Bool, index: Int)
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
            let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: NSLocalizedString("FILL_INFO_NAME", comment: ""), preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (al: UIAlertAction) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else {
            var check = false
            for index in 0..<dataTypes.count {
                let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 1))
                if cell?.accessoryType == .Checkmark {
                    check = true
                    fieldType = dataTypes[index]
                }
            }
            let isTitle = (tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0)) as! TitleFieldCell).sw.on
            if check {
                fieldName = nameCell!.name.text
                
                delegate?.fieldSaved!(fieldName, type: fieldType, isTitle: isTitle, index: index)

                self.navigationController?.popViewControllerAnimated(true)
            }
            else {
                let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: NSLocalizedString("CHOOSE_INFO_TYPE", comment: ""), preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        else {
            return dataTypes.count
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (section == 0 ? "" : NSLocalizedString("TYPE", comment: ""))
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                if nameCell == nil {
                    let cell = tableView.dequeueReusableCellWithIdentifier(reuseID.fieldName, forIndexPath: indexPath) as! FieldNameCell
                    cell.name.text = fieldName
                    nameCell = cell
                }
                return nameCell!
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier(reuseID.titleField, forIndexPath: indexPath) as! TitleFieldCell
                cell.sw.on = isTitle
                return cell
            }
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseID.fieldType, forIndexPath: indexPath) as! FieldTypeCell
            cell.textLabel?.text = dataTitles[indexPath.row]
            if dataTypes.indexOf(fieldType) != nil {
                if (cell.textLabel?.text)! == dataTitles[dataTypes.indexOf(fieldType)!] {
                    cell.accessoryType = .Checkmark
                }
            }
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
            for index in 0..<dataTypes.count {
                let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 1))
                cell?.accessoryType = .None
            }
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .Checkmark
            fieldType = dataTypes[indexPath.row]
        }
    }
}
