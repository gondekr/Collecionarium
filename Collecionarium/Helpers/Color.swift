//
//  Created by Rubens Gondek on 5/17/19.
//  Copyright © 2019 Gondek. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        let red, green, blue: CGFloat
        let hexColor = hex.replacingOccurrences(of: "#", with: "")

        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0

        if scanner.scanHexInt64(&hexNumber) {
            red = CGFloat((hexNumber & 0xff0000) >> 16) / 255
            green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
            blue = CGFloat((hexNumber & 0x0000ff)) / 255

            self.init(red: red, green: green, blue: blue, alpha: 1)
            return
        }

        self.init(red: 0, green: 0, blue: 0, alpha: 1)
    }

    var hexString: String? {
        if let components = self.cgColor.components {
            let red = components[0]
            let green = components[1]
            let blue = components[2]
            return  String(format: "%02X%02X%02X", (Int)(red * 255), (Int)(green * 255), (Int)(blue * 255))
        }
        return nil
    }
}
