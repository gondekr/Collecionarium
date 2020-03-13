//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit

class PredefinedCollectionsView: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cManager = CollectionManager.sharedInstance
    var loadingView: UIView!
    var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false

        configureLoading()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadingView.isHidden = false
        activity.startAnimating()
    }
    
    func configureLoading() {
        loadingView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height-64))
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activity = UIActivityIndicatorView(style: .large)
        activity.frame = loadingView.frame
        loadingView.addSubview(activity)
        loadingView.isHidden = true
        self.collectionView?.addSubview(loadingView)
    }

    // MARK: - Flow layout Delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let x = self.view.frame.width/3 - 10
        return CGSize(width: x, height: x+30)
    }
    
    // MARK: - CollectionView Data Source
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreDefCell", for: indexPath) as! PreDefCell
//        if indexPath.row == 0 {
//            cell.name = NSLocalizedString("CUSTOM", comment: "")
//            cell.imgName = "Custom"
//        }
//        else {
//            cell.name = collections[indexPath.row-1]["name"] as! String
//            cell.imgName = collections[indexPath.row-1]["imageName"] as! String
//        }
//
//        // Configure the cell
        return UICollectionViewCell()
    }
    
    
    // MARK: - Navigation
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "CustomCollection", sender: nil)
        }
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        if identifier == "PreDefSegue" {
//            let item = (collectionView?.indexPathsForSelectedItems?.first?.item)!
//            if item == 0 {
//                return false
//            }
//        }
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "PreDefSegue" {
//            let nColl = segue.destination as! NewCollectionTableView
//            let item = (collectionView?.indexPathsForSelectedItems()?.first?.item)!
//        }
    }
}
