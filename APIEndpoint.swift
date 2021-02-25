//
//  APIEndpoint.swift
//  SampleProject (iOS)
//
//  Created by Osama Chatbi on 23/02/2021.
//

import Foundation

enum APIEndpoint {
    case topScorers(total: Int, limit: Int?)
    case areas
}
