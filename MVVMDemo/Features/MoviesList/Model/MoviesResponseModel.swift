//
//  MoviesResponseModel.swift
//  MVVMDemo
//
//  Created by Mohammed Khaled on 02/22/20.
//  Copyright © 2020 Mohammed Khaled. All rights reserved.
//

import Foundation
import ObjectMapper

class MoviesResponseModel: Mappable {
    
    var results: [MoviesModel]?
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?

    func mapping(map: Map) {
        results <- map["results"]
        page <- map["page"]
        totalResults <- map["total_results"]
        totalPages <- map["total_pages"]
    }
    
    init(results: [MoviesModel]) {
        self.results = results
    }
    
    required init?(map: Map) {

    }
}
