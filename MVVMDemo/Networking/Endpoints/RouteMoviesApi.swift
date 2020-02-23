//
//  RouteMoviesApi.swift
//  MVVMDemo
//
//  Created by Mohammed Khaled on 02/22/20.
//  Copyright © 2020 Mohammed Khaled. All rights reserved.
//

import Foundation
import Moya

//swiftlint:disable all
enum RouteMoviesApi {
    case getLatestMovies(page: Int)
}

extension RouteMoviesApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }
    
    var path: String {
        return "/movie/popular"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getLatestMovies(page: let page):
            return .requestParameters(parameters: ["api_key": Constant.apiKey, "page": String(page)],
                                      encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
}
