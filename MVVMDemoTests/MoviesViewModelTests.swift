//
//  MoviesViewModelTests.swift
//  MVVMDemoTests
//
//  Created by Mohammed Khaled on 12/10/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import XCTest
@testable import MVVMDemo

class MoviesViewModelTests: XCTestCase {
    
    var viewModel: MoviesViewModel!
    var dataSource: GenericDataSource<MoviesModel>!
    fileprivate var service: MockMoviesWebService!
    
    override func setUp() {
        super.setUp()
        self.service = MockMoviesWebService()
        self.dataSource = GenericDataSource<MoviesModel>()
        self.viewModel = MoviesViewModel(service: service, dataSource: dataSource)
    }
    
    override func tearDown() {
        self.service = nil
        self.dataSource = nil
        self.viewModel = nil
        super.tearDown()
    }
    
    func testTetchWithNoService() {
        let expectation = XCTestExpectation(description: "expecting no service")
        viewModel.service = nil
        
        viewModel.onErrorHandling = { error in
            expectation.fulfill()
        }
        
        viewModel.fetchMovies()
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchMovies() {
        let expectation = XCTestExpectation(description: "Movies fetch")
        
        let movie1 = MoviesModel(id: 1, title: "test movie 1")
        let movie2 = MoviesModel(id: 1, title: "test movie 2")
        
        let response = MoviesResponseModel(results: [movie1, movie2])
        
        service.model = response
        self.dataSource.data.addObserver(self) { (movies) in
            print(movies)
            expectation.fulfill()
        }
        
        viewModel.fetchMovies()
        wait(for: [expectation], timeout: 10.0)
    }
}
