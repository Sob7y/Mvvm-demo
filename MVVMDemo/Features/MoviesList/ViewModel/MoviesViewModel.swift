//
//  MoviesViewModel.swift
//  MVVMDemo
//
//  Created by Mohammed Khaled on 02/22/20.
//  Copyright © 2020 Mohammed Khaled. All rights reserved.
//

import Foundation

struct MoviesViewModel {
    weak var dataSource: GenericDataSource<MoviesModel>?
    weak var service: MoviesWebServiceProtocol?
    
    var onErrorHandling: ((ErrorResult?) -> Void)?
    private var page = 1
    
    init(service: MoviesWebServiceProtocol = MoviesWebService.shared, dataSource: GenericDataSource<MoviesModel>) {
        self.dataSource = dataSource
        self.service = service
    }
    
    func fetchMovies() {
        guard let service = service else {
            onErrorHandling?(ErrorResult.custom(string: "Missing service"))
            return
        }
        
        service.getMoviesList(page: page) { (result) in
            switch result {
            case .success(let response):
                self.dataSource?.data.value.append(contentsOf: response.results ?? []) 
            case .failure(let error):
                print(error)
            }
        }
    }
    
    mutating func loadNextPage() {
        self.page += 1
        fetchMovies()
    }
    
    mutating func resetToFirstPage() {
        self.page = 1
        fetchMovies()
    }
}
