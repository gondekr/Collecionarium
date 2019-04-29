//
//  Created by Rubens Gondek on 4/17/19.
//  Copyright (c) 2019 Gondek. All rights reserved.
//

import UIKit

protocol LoginInteractorInput {
  func fetchSomething()
}

protocol LoginInteractorOutput {
  func presentSomething()
}

class LoginInteractor: LoginInteractorInput {
  var output: LoginInteractorOutput!
  var worker: LoginWorker!
  
  // MARK: Business logic
  func fetchSomething() {
    output.presentSomething()
  }
}
