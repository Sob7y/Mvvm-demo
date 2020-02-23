//
//  MockMoviesWebService.swift
//  MVVMDemoTests
//
//  Created by Mohammed Khaled on 12/10/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import XCTest
@testable import MVVMDemo

class MockMoviesWebService: MoviesWebServiceProtocol {
    
    var model: MoviesResponseModel?

    func getMoviesList(page: Int, compeltion: @escaping ((Result<MoviesResponseModel, ErrorResult>) -> Void)) {
        if let model = self.model {
            compeltion(Result.success(model))
        } else {
            compeltion(Result.failure(ErrorResult.custom(string: "no data")))
        }
    }
}
