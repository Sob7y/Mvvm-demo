//
//  NetworkDefaults.swift
//
//  Created by Mohammed Khaled on 02/22/20.
//  Copyright © 2020 Mohammed Khaled. All rights reserved.
//

import Foundation

struct NetworkDefaults {
    var baseUrl: String = "https://api.themoviedb.org/3"
    var apiKey: String = "81214f14b3b4fc4623c6b48bb307ab11"
	var language: String = "en-US"
    
    static var `defaults`: NetworkDefaults {
        let instance = NetworkDefaults()
        return instance
    }
}
