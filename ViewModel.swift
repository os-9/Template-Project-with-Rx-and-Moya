//
//  ViewModel.swift
//  SampleProject (iOS)
//
//  Created by Osama Chatbi on 24/02/2021.
//

import Foundation
import RxSwift
import Moya

class ViewModel {
    private let networkManager = NetworkManager()
    
    func loadMovieDetail(movieId: String) -> Observable<MovieResponse> {
        return Observable.create { (obs) -> Disposable in
            self.networkManager.fetchPopularMovies { (resp) in
                switch resp {
                case .success(let succ):
                    obs.onNext(succ)
                    obs.onCompleted()
                case .failure(let error):
                    obs.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
