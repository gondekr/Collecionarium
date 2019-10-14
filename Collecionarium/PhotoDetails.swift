//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class PhotoDetails: UIViewController {
    @IBOutlet weak var btnL: UIButton!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnR: UIButton!

    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateImg()
    }
    
    @IBAction func close(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func left(sender: AnyObject) {
        index -= 1
        updateImg()
    }
    
    @IBAction func right(sender: AnyObject) {
        index += 1
        updateImg()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 210/255, green: 77/255, blue: 87/255, alpha: 1)
    }
    
    func updateImg() {
        btnR.alpha = 0.75
        btnL.alpha = 0.75
//        if index == photos.count - 1 {
//            btnR.alpha = 0
//        }
//        if index == 0 {
//            btnL.alpha = 0
//        }
//        if subs.count != 0 {
//            self.navigationItem.title = "\(subs[index])"
//        }
    }
    
    @IBAction func deletePhoto(sender: AnyObject) {
    }
    
    @IBAction func actionClick(sender: AnyObject) {
    }
}
