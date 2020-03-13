//
//  Copyright © 2019 GondekR. All rights reserved.
//

import UIKit
import MessageUI

class UserItemVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var getBtn: DesignButton!
    
    @IBOutlet weak var pageIndicator: UIPageControl!
    
    var loadingView: UIView!
    var activity: UIActivityIndicatorView!
    
    var fields: [String]! = []
    var values: [String]! = []
    var trade: Bool! = false
    
    func configureLoading() {
        loadingView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activity = UIActivityIndicatorView(style: .large)
        activity.frame = loadingView.frame
        loadingView.addSubview(activity)
        loadingView.isHidden = true
        self.collectionView.addSubview(loadingView)
    }
    
    func endRefresh() {
        loadingView.isHidden = true
        activity.stopAnimating()
        collectionView.reloadData()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLoading()
        loadingView.isHidden = false
    
        activity.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getBtn.isHidden = !trade
    }

    @IBAction func sendEmail(sender: AnyObject) {
        let mail = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mail, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setSubject("EU QUERO! - Collecionarium")
        mailComposerVC.setMessageBody("Estou interessado no seu item e gostaria de obter mais informações", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .alert)
        sendMailErrorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    private func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Scroll View
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageIndicator.currentPage = Int(collectionView.contentOffset.x / collectionView.frame.size.width)
    }
    
    // MARK: - Table View
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NSLocalizedString("INFORMATIONS", comment: "")
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userItemInfoCell", for: indexPath)

        return cell
    }
    
    // MARK: - Collection View
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let x = (collectionView.frame.size.width - collectionView.frame.height)/2
        return UIEdgeInsets(top: 0, left: x, bottom: 0, right: x)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView.frame.width-collectionView.frame.height
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
