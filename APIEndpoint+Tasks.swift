//
//  APIEndpoint+Tasks.swift
//  SampleProject (iOS)
//
//  Created by Osama Chatbi on 23/02/2021.
//

import Foundation
import Moya

extension APIEndpoint {
    var task: Task {
        switch self {
        case .topScorers(_, let limit):
            var params: [String: Any] = [:]
            if let limit = limit {
                params["limit"] = "\(limit)"
            }
            return .requestParameters(parameters: params, encoding: parameterEncoding)
        case .areas:
            return .requestPlain
        }
    }
}
