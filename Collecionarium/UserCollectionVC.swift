//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class UserCollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userImg: DesignImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
//    let iParse = ItemParse.sharedInstance

    var items: [Any] = []
    var loadingView: UIView!
    var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLoading()
        loadingView.isHidden = false
        activity.startAnimating()
        userImg.image = UIImage(named: "noimage")
    }
    
    func configureLoading() {
        loadingView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: collectionView.frame.height))
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activity = UIActivityIndicatorView(style: .whiteLarge)
        activity.frame = loadingView.frame
        loadingView.addSubview(activity)
        loadingView.isHidden = true
        self.collectionView.addSubview(loadingView)
    }
    
    func endRefresh() {
        loadingView.isHidden = true
        activity.stopAnimating()
        collectionView.reloadData()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Collection View
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID.item, for: indexPath as IndexPath) as! ItemCell
        return cell
    }
    
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 160, height: 190)
    }
}
