//
//  MainWebService.swift
//  MVVMDemo
//
//  Created by Mohammed Khaled on 02/22/20.
//  Copyright © 2020 Mohammed Khaled. All rights reserved.
//

import Foundation
import Moya

final class MainWebService {
    static func fetch(endPoint: TargetType, _ compltion: @escaping (Result<Any, NetworkError>) -> Void) {
        MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin()]).request(MultiTarget(endPoint)) { (response) in
            switch response {
            case .success(let response):
                do {
                    let jsonResponse = try response.mapJSON()
                    compltion(Result.success(jsonResponse))
                } catch {
                    print(error.localizedDescription)
                }
                
            case .failure(let error):
                compltion(.failure(NetworkError(error: error)))
            }
        }
    }
}
