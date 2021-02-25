//
//  API.swift
//  SampleProject (iOS)
//
//  Created by Osama Chatbi on 23/02/2021.
//

import Foundation
import Moya
import Alamofire

/**
 This class exposes all methods that can be used to send requests to the remote APIs and manage their responses.
 */
class API {
    /**
     Returns a provider, that may use a user authentication token.
     
     - returns: a Moya provider
     */
    class func provider(_ showActivityIndicator: Bool = true) -> MoyaProvider<APIEndpoint> {
        let closure = { (target: APIEndpoint) -> Endpoint in
            let url = target.baseURL.appendingPathComponent(target.path).absoluteString
            
            return Endpoint(url: url,
                            sampleResponseClosure: { .networkResponse(200, Data()) },
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .useProtocolCachePolicy
        configuration.urlCredentialStorage = nil

        let networkActivityPlugin = NetworkActivityPlugin { (type, _) in
            switch type {
            case .began:
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = true
                }
            case .ended:
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
        
        let cUrl = NetworkLoggerPlugin(configuration: .init(formatter: .init(), output: { (_, array) in
            if let log = array.first {
                print(log)
            }
        }, logOptions: .formatRequestAscURL))
        
        return MoyaProvider<APIEndpoint>(
            endpointClosure: closure,
            plugins: [networkActivityPlugin, cUrl]
        )
    }
}
