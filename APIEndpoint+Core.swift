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
        return Data()
    }
    
    var headers: [String : String]? {
        return nil
        //return ["Content-type": "application/json"]
    }
    
    private func getBaseUrl() -> URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/") else { fatalError() }
        return url
    }
    
    private func getAPIToken() -> String {
        return ""
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
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

