//
//  Copyright © 2019 GondekR. All rights reserved.
//

import Foundation

@objc protocol ItemFieldDelegate {
    @objc optional func nextField(tag: Int)
}
