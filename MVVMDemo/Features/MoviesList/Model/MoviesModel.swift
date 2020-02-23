//
//  MoviesModel.swift
//  MVVMDemo
//
//  Created by Mohammed Khaled on 02/22/20.
//  Copyright © 2020 Mohammed Khaled. All rights reserved.
//

import Foundation
import ObjectMapper

class MoviesModel: Mappable {
    
    var popularity: Double?
    var voteCount: Int?
    var video: Bool?
    var posterPath: String?
    var id: Int?
    var adult: Bool?
    var backdropPath: String?
    var originalLanguage: String?
    var originalTitle: String?
    var genreIDs: [Int]?
    var title: String?
    var voteAverage: Double?
    var overview: String?
    var releaseDate: String?
    
    required init?(map: Map) {
        
    }
    
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
    
    func mapping(map: Map) {
        popularity <- map["popularity"]
        voteCount <- map["vote_count"]
        video <- map["video"]
        posterPath <- map["poster_path"]
        id <- map["id"]
        
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        genreIDs <- map["genre_ids"]
        
        title <- map["title"]
        voteAverage <- map["vote_average"]
        overview <- map["overview"]
        releaseDate <- map["release_date"]
    }
}
