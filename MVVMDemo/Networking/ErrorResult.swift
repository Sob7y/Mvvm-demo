//
//  ErrorResult.swift
//  MVVMDemo
//
//  Created by Mohammed Khaled on 12/10/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case custom(string: String)
}
