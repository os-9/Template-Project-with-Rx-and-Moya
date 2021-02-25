//
//  ClientAPI.swift
//  SampleProject (iOS)
//
//  Created by Osama Chatbi on 24/02/2021.
//

import Foundation
import RxSwift
import Moya
   
struct ClientAPI {
    let provider = MoyaProvider<APIEndpoint>()
    let disposeBag = DisposeBag()
    
    private static let shared = ClientAPI()
    private init() {}
    // We're returning a Single response with just an array with the retrieved posts.
    // You could return an Observable<PostJSON> if you need to, this is just an example.
    func getScore() -> Single<String>{
        return provider.rx // we use the Reactive component for our provider
            .request(.areas) // we specify the call
            .filterSuccessfulStatusAndRedirectCodes() // we tell it to only complete the call if the operation is successful, otherwise it will give us an error
            .map(String.self) // we map the response to our Codable objects
    }

    // Here we return a Completable because we only need to know if the call is done or if there was an error.
    func deletePost(with id: Int) -> Completable {
            return provider.rx
                .request(.topScorers(total: id, limit: id))
                .filterSuccessfulStatusAndRedirectCodes()
                .asObservable().ignoreElements()            // we're converting to Observable and ignoring events in order to return a Completable, which skips onNext and only maps to onCompleted
    }
}
   
   
