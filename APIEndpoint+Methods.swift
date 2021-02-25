//
//  APIEndpoint+Methods.swift
//  SampleProject (iOS)
//
//  Created by Osama Chatbi on 23/02/2021.
//

import Foundation
import Moya

extension APIEndpoint {
    var method: Moya.Method{
        switch self {
        case .topScorers:
            return .get
        case .areas:
            return .get
        }
    }
}
