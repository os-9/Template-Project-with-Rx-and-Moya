//
//  APIEndpoint+Tasks.swift
//  SampleProject (iOS)
//
//  Created by Osama Chatbi on 23/02/2021.
//

import Foundation
import Moya

enum Constants {
        enum API {
            static let apiKey = "7e8a76c1bd818cc68473abb1e5fc2a20"
        }
    }

extension APIEndpoint {
    var task: Task {
            switch self {
            case .popular, .movie:
                return .requestParameters(parameters: ["api_key": Constants.API.apiKey], encoding: URLEncoding.queryString)
            case .search(let query):
                return .requestParameters(parameters: ["query" : query, "api_key": Constants.API.apiKey], encoding: URLEncoding.queryString)
            }
        }
}
