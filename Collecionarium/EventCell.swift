//
//  EventCell.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 10/30/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import UIKit
import Parse

class EventCell: UITableViewCell {

    @IBOutlet weak var imgItem: DesignImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var imgType: DesignImageView!
    @IBOutlet weak var cellBody: DesignView!
    
    let colors = [UIColor(red: 68/255, green: 140/255, blue: 203/255, alpha: 1),
                  UIColor(red: 124/255, green: 197/255, blue: 118/255, alpha: 1),
                  UIColor(red: 247/255, green: 202/255, blue: 24/255, alpha: 1),
                  UIColor(red: 246/255, green: 71/255, blue: 71/255, alpha: 1)]
    
    let pH = ParseHelper.sharedInstance
    
    var event: PFObject? {
        didSet {
            eventName.text = NSLocalizedString((event!["name"] as! String), comment: "")
            collectionName.text = event!["collectionName"] as? String
            let type = event!["type"] as! Int
            if type == 3 {
                imgItem.image = UIImage(named: "hue")
            }
            else {
                imgItem.image = UIImage(named: "noimage")
            }
            imgType.image = UIImage(named: "EventType\(type)")
            imgType.borderColor = colors[type]
            cellBody.borderColor = colors[type]
            userName.text = event!["userName"] as? String
            let photo = event?["itemPhoto"]
            if photo != nil {
                (photo as! PFFile).getDataInBackgroundWithBlock { (data, error) -> Void in
                    if error == nil {
                        self.imgItem.image = UIImage(data: data!)
                    }
                }
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
