//
//  Created by Rubens Gondek on 5/20/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self.uppercased(), comment: "")
    }
}
