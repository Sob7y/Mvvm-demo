//
//  Extensions.swift
//  MVVMDemo
//
//  Created by Mohammed Khaled on 02/22/20.
//  Copyright © 2020 Mohammed Khaled. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    class var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController {
    class var identifier: String {
        return String(describing: self)
    }
}
