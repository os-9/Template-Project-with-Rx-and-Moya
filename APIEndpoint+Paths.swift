//
//  APIEndpoint+Paths.swift
//  SampleProject (iOS)
//
//  Created by Osama Chatbi on 23/02/2021.
//

import Foundation

extension APIEndpoint {
    var path: String {
            switch self {
            case .popular:
                return "movie/popular"
            case .movie(let movieId):
                return "movie/\(movieId)"
            case .search:
                return "search/movie"
            }
        }
}
