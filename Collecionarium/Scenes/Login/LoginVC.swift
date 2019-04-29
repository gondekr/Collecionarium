//
//  Created by Rubens Gondek on 4/17/19.
//  Copyright (c) 2019 Gondek. All rights reserved.
//

import UIKit

protocol LoginVCInput {
    func displayAlert(_ alert: UIAlertController)
    func displaySuccessLogin()
}

protocol LoginVCOutput {
    func askForLogin(email: String, password: String)
}

class LoginVC: UIViewController {
    var output: LoginVCOutput!
    var router: LoginRouter!

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPass: UITextField!

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        LoginConfigurator.shared.configure(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func doLogin() {
        guard let login = txtUser.text,
            let pass = txtPass.text
            else { return }
        output.askForLogin(email: login, password: pass)
    }
}

extension LoginVC: LoginVCInput {
    func displayAlert(_ alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }

    func displaySuccessLogin() {
        router.navigateToHome()
    }
}
