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
        case .topScorers(let total, _):
            return "/competitions/\(total)/scores"
        case .areas:
            return "/competitions"
        }
    }
}
