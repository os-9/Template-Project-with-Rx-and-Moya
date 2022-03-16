//
//  ContentView.swift
//  Shared
//
//  Created by Osama Chatbi on 23/02/2021.
//

import SwiftUI
import RxSwift

struct ContentView: View {
    @ObservedObject var updater = DelayedUpdater()
    var body: some View {
        Text("Hello, world!").padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}

@MainActor class DelayedUpdater: ObservableObject {
    init() {
        ViewModel().loadMovieDetail(movieId: "222").subscribe { movieResp in
            print(movieResp.results)
        } onError: { error in
            print("2")
        } onCompleted: {
            print("Completed")
        } onDisposed: {
            DisposeBag()
        }
    }
}
