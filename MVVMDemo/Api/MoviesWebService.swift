//
//  MoviesWebService.swift
//  MVVMDemo
//
//  Created by Mohammed Khaled on 02/22/20.
//  Copyright © 2020 Mohammed Khaled. All rights reserved.
//

import Foundation
import ObjectMapper

protocol MoviesWebServiceProtocol: class {
    func getMoviesList(page: Int, compeltion: @escaping ((Result<MoviesResponseModel, ErrorResult>) -> Void))
}

class MoviesWebService: MoviesWebServiceProtocol {
    static let shared = MoviesWebService()
    
    func getMoviesList(page: Int, compeltion: @escaping ((Result<MoviesResponseModel, ErrorResult>) -> Void)) {
        MainWebService.fetch(endPoint: RouteMoviesApi.getLatestMovies(page: page)) { (result) in
            switch result {
            case .success(let response):
                guard let moviesResponse = Mapper<MoviesResponseModel>().map(JSONObject: response) else {
                    return
                }
                compeltion(Result.success(moviesResponse))
            case .failure(let error):
                compeltion(Result.failure(ErrorResult.network(string: error.localizedDescription)))
            }
        }
    }
}
