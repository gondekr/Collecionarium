//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit
import QuickLook

class DetailTableView: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ItemFieldDelegate {
    
    var values: [String] = []
    var fields: [String] = []
    var types: [String] = []
    var subs: [String] = []
    
    var cells: [UITableViewCell]! = []
    
    var photoCell = PhotosTableViewCell()
    
    let iManager = ItemManager.sharedInstance
    
    var saved = false
    var usingPhotos = false
    var newItem = true
    
    @IBOutlet weak var okBtn: UIBarButtonItem!
    
    // MARK: - Public API
    var localItem: Item? {
        didSet {
//            newItem = false
//            values = localItem!.values
//            subs = localItem!.subtitle
//            if localColl?.titleIndex != -1 {
//                self.navigationItem.title = values[localColl!.titleIndex as! Int]
//            }
        }
    }
//    var localColl: Collection? {
//        didSet {
//            fields = (localColl?.fields)!
//            types = (localColl?.types)!
//            for _ in 0..<fields.count {
//                values.append("")
//            }
//        }
//    }
    
    // MARK: - Configuring Layout
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let typ = ["String", "Text", "Number", "Year", "Date", "Boolean"]
        
        var nib : UINib?
        for i in 0..<typ.count {
            nib = UINib(nibName: typ[i], bundle: nil);
            tableView.register(nib, forCellReuseIdentifier: reuseID.customType[i]);
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        usingPhotos = false
        self.photoCell.collectionView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    // MARK: - Delegate
    func nextField(tag: Int) {
        if has(tag: tag+1).0 {
            let cell = cells[tag+1]
            switch types[cell.tag] {
            case dataTypes[0]:
                (cell as! ItemStringCell).txtValue.becomeFirstResponder()
            case dataTypes[1]:
                (cell as! ItemTextCell).txtValue.becomeFirstResponder()
            case dataTypes[2]:
                (cell as! ItemIntCell).txtValue.becomeFirstResponder()
            default:
                break
            }
        }
        else {
            cells[tag].resignFirstResponder()
        }
    }
    
    func has(tag: Int) -> (Bool, UITableViewCell?){
        for cell in cells {
            if cell.tag == tag {
                return (true, cell)
            }
        }
        return (false, nil)
    }
    
    // MARK: - Save Item
    @IBAction func saveItem(sender: AnyObject) {
        if !filled() {
            let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: NSLocalizedString("FILL_THE_FIELDS", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if /* empty photos */ false {
                let alert = UIAlertController(title: NSLocalizedString("WARNING", comment: ""), message: NSLocalizedString("SAVE_NO_PHOTOS", comment: ""), preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("NO", comment: ""), style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: NSLocalizedString("YES", comment: ""), style: .default, handler: { (al: UIAlertAction) -> Void in
                    self.save()
                }))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                self.save()
            }
        }
    }
    
    func save() {
//        if cloudColl != nil {
//            if newItem {
//                iParse.newItem(values, ph: photos as! [PFFile], subs: subs, coll: cloudColl!).1
//            }
//            else {
//                cloudItem!["values"] = values
//                cloudItem!["photos"] = photos
//                cloudItem!["subtitle"] = subs
//                cloudItem!.saveInBackground()
//            }
//        } else {
//            if localItem == nil {
//                let nItem = iManager.newItem()
//                nItem.values = values
//                nItem.photos = photos as! [NSData]
//                nItem.collection = localColl
//            }
//            else {
//                localItem?.values = values
//                localItem?.photos = photos as! [NSData]
//            }
//            iManager.save()
//            saved = true
//        }
//        self.navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: - Verification
    func filled() -> Bool{
        for index in 0..<fields.count {
            let cell = cells[index] as! ItemDetailCell
            var val = ""
            cell.updateValue()
            val = cell.value!
            if val == "" || val == NSLocalizedString("YEAR", comment: "") {
                return false
            }
            else {
                if values.count >= fields.count {
                    values[index] = val
                }
                else {
                    values.append(val)
                }
                
            }
        }
        return true
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0 ? 1 : fields.count)
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (section == 0 ? NSLocalizedString("PHOTOS", comment: "") : NSLocalizedString("INFORMATIONS", comment: ""))
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ((indexPath.section == 0 && indexPath.row == 0) ? 140 : (types[indexPath.row] == dataTypes[1] ? 100 : 45))
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: reuseID.photosView, for: indexPath) as! PhotosTableViewCell
//            photoCell = cell
//            return cell
//        }
//        else{
//            let fi = fields[indexPath.row]
//            var val = ""
//            if !newItem {
//                val = values[indexPath.row]
//            }
//
//            let cell = tableView.dequeueReusableCellWithIdentifier(id, forIndexPath: indexPath) as! ItemDetailCell
//            cell.fieldName = fi
//            cell.tag = indexPath.row
//            cell.value = val
//
//            if id == "YearCell" {
//                (cell as! ItemYearCell).viewController = self
//            }
//            if id == "DateCell" {
//                (cell as! ItemDateCell).viewController = self
//            }
//
//            cells.append(cell)
//            cell.delegate = self
//            return cell
//
//        }
        return UITableViewCell()
    }
    
    // MARK: - Image Picker Methods
    func imageHandler() {
        usingPhotos = true
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.isEditing = true
        imgPicker.allowsEditing = true
        
        let aSheet = UIAlertController(title: NSLocalizedString("ADD_PHOTO", comment: ""), message: NSLocalizedString("PHOTO_SOURCE", comment: ""), preferredStyle: .actionSheet)
        aSheet.addAction(UIAlertAction(title: NSLocalizedString("CAMERA", comment: ""), style: .default, handler: { (al: UIAlertAction) -> Void in
            imgPicker.sourceType = .camera
            let overView = UIView(frame: CGRect(x: 0, y: 40, width: self.view.frame.width, height: self.view.frame.width + 100 + 70))
            let view1 = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
            view1.backgroundColor = UIColor.black
            let view2 = UIView(frame: CGRect(x: 0, y: overView.frame.height - 100, width: self.view.frame.width, height: 100))
            view2.backgroundColor = UIColor.black

            overView.addSubview(view1)
            overView.addSubview(view2)
            overView.backgroundColor = UIColor.clear
            imgPicker.cameraOverlayView = overView
            imgPicker.showsCameraControls = true
            self.present(imgPicker, animated: true, completion: nil)
        }))
        aSheet.addAction(UIAlertAction(title: NSLocalizedString("PHOTO_LIBRARY", comment: ""), style: .default, handler: { (al: UIAlertAction) -> Void in
            imgPicker.sourceType = .photoLibrary
            self.present(imgPicker, animated: true, completion: nil)
        }))
        aSheet.addAction(UIAlertAction(title: NSLocalizedString("CANCEL", comment: ""), style: .cancel, handler: nil))
        aSheet.popoverPresentationController?.sourceView = photoCell.viewWithTag(0)
        self.present(aSheet, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        guard let img = info[.editedImage] else {
//            return
//        }
//
//        let finalImg = Toucan(image: img as! UIImage).resize(CGSize(width: 300, height: 300), fitMode: Toucan.Resize.FitMode.Crop).image
//
//        let jpegData = UIImageJPEGRepresentation(finalImg, 0.0)
//
//        photoCell.photos = photos
//
//        dismiss(animated: true, completion: nil)
//        usingPhotos = false
//
//        
//        let docDir = NSSearchPathDirectory.DocumentDirectory
//        let uDomMask = NSSearchPathDomainMask.UserDomainMask
//        
//        let imgName = NSUUID().UUIDString
//        
//        let paths = NSSearchPathForDirectoriesInDomains(docDir, uDomMask, true)
//        if paths.count > 0 {
//                    }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowImg" {
//            let imgView = segue.destinationViewController as! PhotoDetails
//
//            let index = photoCell.collectionView.indexPathsForSelectedItems()?.first?.item
//
//            imgView.photos = photos
//            imgView.subs = subs
//            imgView.index = index!
//            imgView.itemType = (cloudColl != nil ? .Cloud : .Local)
//
//            usingPhotos = true
//        }
    }
    
//    func numberOfPreviewItemsInPreviewController(controller: QLPreviewController) -> Int {
//        return photos.count
//    }
//    
//    func previewController(controller: QLPreviewController, previewItemAtIndex index: Int) -> QLPreviewItem {
//        let path = "\(photos[index]).jpeg"
//        let url = NSURL(fileURLWithPath: path)
//        return url
//    }
}
