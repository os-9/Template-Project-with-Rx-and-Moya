//
//  APIEndpoint+Core.swift
//  SampleProject (iOS)
//
//  Created by Osama Chatbi on 23/02/2021.
//

import Foundation
import Moya

extension APIEndpoint: TargetType {
    
    var baseURL: URL {
        return getBaseUrl()
    }
    
    var sampleData: Data {
        return try! JSONSerialization.data(withJSONObject: [String: String](), options: .prettyPrinted)
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    private func getBaseUrl() -> URL {
        return URL(string: "https://api.football-data.org/v2")!
    }
    
    private func getAPIToken() -> String {
        return "e3deec4a266742d2b1793fa8db47ca11"
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .areas, .topScorers:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
}
// Header could also be like this.
//    switch self {
//    case .getWifiNetworks, .setWifiNetwork:
//        return nil
//    default:
//        var locale = "en"
//
//        if Config.locale?.contains("it") ?? false {
//            locale = "it"
//        }
//
//        return [
//            "Ocp-Apim-Subscription-Key": apiKey,
//            "Authorization": "Bearer \(accessToken)",
//            "Accept-Language": locale
//        ]
//    }
