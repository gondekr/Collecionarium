//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class NewCollectionTableView: UITableViewController, NewFieldDelegate, AddFieldDelegateOld {
    
    // MARK: - Privates
    // MARK: Variables
    var fi = 0
    var fields: [String] = []
    var types: [String] = []
    var titleIndex: Int = -1
    var collName: String = ""
    var cells: [UITableViewCell] = []
    var editingCollection = false
    var online = false
    var shared = false
    var isShared = false
    var actions: [[String:String]] = []
    
    // MARK: Constants
    let cMan = CollectionManager.sharedInstance
    let iMan = ItemManager.sharedInstance
    let emptyImg = UIImage()
    
    // MARK: Public API
    
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBAction func voltar(sender: AnyObject) {
//        let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: NSLocalizedString("LEAVE_WITHOUT_SAVE", comment: ""), preferredStyle: .Alert)
//        alert.addAction(UIAlertAction(title: NSLocalizedString("YES", comment: ""), style: .Destructive, handler: { (al: UIAlertAction) -> Void in
//            if self.editingCollection {
//                self.navigationController?.popToRootViewControllerAnimated(true)
//            }
//            else {
//                self.navigationController?.popViewControllerAnimated(true)
//            }
//        }))
//        alert.addAction(UIAlertAction(title: NSLocalizedString("NO", comment: ""), style: .Default, handler: nil))
//        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationItem.leftBarButtonItem = btnBack
        
//        let nib : UINib = UINib(nibName: "AddNewFieldCell", bundle: nil);
//        tableView.registerNib(nib, forCellReuseIdentifier: "AddFieldCell");
    }
    
    override func viewDidLayoutSubviews() {
        if editingCollection {
            editingCollection = false
        }
    }
    
    // MARK: - Delegate
    func fieldSaved(name: String, type: String, isTitle: Bool, index: Int) {
//        let cell = cells[index + 4]
//        if isTitle {
//            updateTitle(index)
//        }
//        else {
//            cell.imageView?.image = self.emptyImg
//        }
//        cell.textLabel?.text = name
//        cell.detailTextLabel?.text = dataTitles[dataTypes.indexOf(type)!]
//        fields[index] = name
//        types[index] = type
//        self.tableView.reloadData()

    }
    
    func buttonTapped() {
//        if fi == 10 {
//            let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: NSLocalizedString("ONLY_TEN", comment: ""), preferredStyle: .Alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alert, animated: true, completion: nil)
//        }
//        else {
//            fi++
//            fields.append("")
//            types.append("")
//            actions.append(["action":"addField"])
//
//            tableView.reloadData()
//            tableView.selectRowAtIndexPath(NSIndexPath(forRow: (fi-1), inSection: 2), animated: true, scrollPosition: UITableViewScrollPosition.Middle)
//            performSegueWithIdentifier("FieldDetail", sender: true)
//        }
    }
    
    func executeActions() {
//        for action in actions {
//            switch action["action"]! {
//            case "addField":
//                if cloudColl != nil {
//                    iParse.addField("", coll: cloudColl!)
//                }
//                else if localColl != nil {
//                    iMan.addField(localColl!)
//                }
//            case "deleteField":
//                if cloudColl != nil {
//                    iParse.deleteField(cloudColl!, index: Int(action["index"]!)!)
//                }
//                if localColl != nil {
//                    iMan.deleteField(localColl!, index: Int(action["index"]!)!)
//                }
//            default: break
//            }
//        }
    }
    
    // MARK: Verification
    
    func cellFilledAtRow(row: Int) -> Bool {
        return (cells[row+4].textLabel?.text != NSLocalizedString("INFORMATION", comment: "")) && (cells[row+4].detailTextLabel?.text != NSLocalizedString("TYPE", comment: ""))
    }
    
    func filled() -> Bool {
        for cell in cells {
            switch cell.tag {
            case 10:
                collName = (cell as! CollNameCell).name.text!
                if collName == "" {
                    return false
                }
            case 11: break
            default:
                if (cell.textLabel?.text == NSLocalizedString("INFORMATION", comment: "")) && (cell.detailTextLabel?.text == NSLocalizedString("TYPE", comment: "")) {
                    return false
                }
            }
        }
        return true
    }
    
    func has(tag: Int) -> (Bool, UITableViewCell?){
        for cell in cells {
            if cell.tag == tag {
                return (true, cell)
            }
        }
        return (false, nil)
    }
    
    func indexOfTitle() -> Int{
        for c in cells {
            if c.imageView?.image == UIImage(named: "TitleImg") {
                return c.tag
            }
        }
        return -1;
    }
    
    // MARK: - Save
    
    @IBAction func saveCollection(sender: AnyObject) {
//        if filled() {
//            executeActions()
//            titleIndex = indexOfTitle()
//            if cloudColl == nil && localColl == nil {
//                if online {
//                    cParse.insertCollection(collName, fields: fields, types: types, titleIndex: titleIndex, shared: shared).1
//                }
//                else {
//                    cMan.insertCollection(collName, fields: fields, types: types, titleIndex: titleIndex).1
//                }
//            }
//            else if cloudColl != nil {
//                if online {
//                    cloudColl!["name"] = collName
//                    cloudColl!["fields"] = fields
//                    cloudColl!["types"] = types
//                    cloudColl!["titleIndex"] = titleIndex
//                    cloudColl!["shared"] = shared
//                    if isShared != shared {
//                        if shared {
//                            eParse.newEvent(3, txt: "SHARED_COLL", item: nil, coll: cloudColl!, img: nil)
//                        }
//                        else {
//                            eParse.deleteEventsOfCollection(cloudColl!)
//                        }
//                    }
//
//                    cloudColl?.saveEventually()
//                }
//                else {
//                    let coll = cMan.insertCollection(collName, fields: fields, types: types, titleIndex: titleIndex).0
//                    cParse.addItemsToCoreData(coll, cloudColl: cloudColl!)
//                    cloudColl?.deleteInBackground()
//                }
//            }
//            else {
//                if !online {
//                    localColl?.name = collName
//                    localColl?.fields = fields
//                    localColl?.types = types
//                    localColl?.titleIndex = titleIndex
//                    cMan.save()
//                }
//                else {
//                    let coll = cParse.insertCollection(collName, fields: fields, types: types, titleIndex: titleIndex, shared: shared).0
//                    cMan.addItemsToParse(coll, coll: localColl!)
//                    cMan.deleteCollection(localColl!)
//                }
//            }
//            if !self.editingCollection {
//                self.navigationController?.popToRootViewControllerAnimated(true)
//            }
//            else {
//                self.navigationController?.popViewControllerAnimated(true)
//            }
//        }
//        else {
//            let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: NSLocalizedString("FILL_THE_FIELDS", comment: ""), preferredStyle: .Alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alert, animated: true, completion: nil)
//        }
    }
    @IBAction func switchChange(sender: UISwitch) {
//        if sender.tag == 1 {
//            online = sender.on
//            tableView.beginUpdates()
//            tableView.endUpdates()
//        }
//        else if sender.tag == 2 {
//            shared = sender.on
//        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

//    // MARK: Editing
//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        if indexPath.section == 0 || indexPath.section == 1 {
//            return false
//        }
//        else {
//            return true
//        }
//    }
//
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
////        if editingStyle == .Delete {
////            // Delete the row from the data source
////            cells.removeAtIndex(indexPath.row+4)
////            fields.removeAtIndex(indexPath.row)
////            types.removeAtIndex(indexPath.row)
////
////            actions.append(["action":"deleteField", "index":"\(indexPath.row)"])
////
////            atualizaTags()
////            fi--
////            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
////            tableView.reloadData()
////        }
//    }
//
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
////        if segue.identifier == "FieldDetail" {
////            let field = segue.destinationViewController as! NewFieldTableView
////            field.delegate = self
////            let row = (tableView.indexPathForSelectedRow?.row)!
////            field.index = row
////            if let _ = (sender as? Bool) {
////                field.fieldName = ""
////                field.fieldType = ""
////                field.isTitle = false
////            }
////            else {
////                field.fieldName = fields[row]
////                field.fieldType = types[row]
////                field.isTitle = (cells[row+4].imageView?.image == UIImage(named: "TitleImg"))
////            }
////        }
//    }
}
