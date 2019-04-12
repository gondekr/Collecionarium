//
//  ItemNextFieldDelegate.swift
//  Collecionarium
//
//  Created by Rubens Gondek on 9/29/15.
//  Copyright © 2015 BEPiD. All rights reserved.
//

import Foundation

@objc protocol ItemFieldDelegate {
    optional func nextField(tag: Int)
}
