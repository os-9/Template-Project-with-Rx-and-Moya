//
//  ViewModel.swift
//  SampleProject (iOS)
//
//  Created by Osama Chatbi on 24/02/2021.
//

import Foundation
import RxSwift

class PostsViewModel {
    
    func fetchRemotePosts() -> Completable {
        return .create { observer in
            ClientAPI.getScore()
                .subscribe(onSuccess: { jsonPosts: String in
                    // we fetched the posts
                    observer(.completed)
                }, onError: { error in
                    // there was an error fetching the posts
                    observer(.error(error))
                })
        }
    }

    func deletePost(with id: Int) -> Completable {
        return .create { observer in
            ClientAPI.deletePost(with: id)
                .subscribe(onCompleted: {
                    // we successfully deleted the post
                    observer(.completed)
                }, onError: { error in
                    // there was an error deleting the post
                    observer(.error(error))
                })
        }
    }
    
    
}
