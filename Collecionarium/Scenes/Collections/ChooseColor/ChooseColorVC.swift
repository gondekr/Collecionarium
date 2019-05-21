//
//  Created by Rubens Gondek on 5/20/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

protocol ChooseColorDelegate {
    func didSelectColor(_ color: String)
}

class ChooseColorVC: UIViewController {
    var router: ChooseColorRouter!

    var delegate: ChooseColorDelegate?
    var selectedColor: String?

    let colors = ["Berry", "Jeans", "Leaf", "Orange", "Violet", "Watermelon", "Yolk"]

    @IBOutlet weak var cellTag: UIView!

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        ChooseColorConfigurator.shared.configure(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitial()
    }

    @IBAction func selectColor(_ sender: UIButton) {
        let name = colors[sender.tag]
        selectedColor = name
        let color = UIColor(named: name) ?? .white
        setupPreview(withColor: color)
    }

    @IBAction func btnSavePressed(_ sender: UIBarButtonItem) {
        delegate?.didSelectColor(selectedColor ?? "Color")
        router.goBack()
    }

    func setupInitial() {
        guard let name = selectedColor,
            let color = UIColor(named: name)
            else { return }
        setupPreview(withColor: color)
    }

    func setupPreview(withColor color: UIColor) {
        cellTag.backgroundColor = color
    }
}
