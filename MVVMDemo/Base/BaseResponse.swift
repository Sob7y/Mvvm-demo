//
//  BasePresenter.swift
//  Sabq
//
//  Created by Mohammed Khaled on 7/15/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponse: NSObject, Mappable {
    
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        page <- map["page"]
        totalResults <- map["total_results"]
        totalPages <- map["total_pages"]
    }
}
