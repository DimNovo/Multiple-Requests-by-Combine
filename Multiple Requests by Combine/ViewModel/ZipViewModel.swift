//
//  ZipViewModel.swift
//  Multiple Requests by Combine
//
//  Created by Dmitry Novosyolov on 13/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import Foundation
import Combine

final class ZipViewModel: ObservableObject {
    private lazy var netService = NetService()
    private var cancellable: AnyCancellable?
    @Published var presentComments = false
    @Published var posts = [Post]()
    @Published var comments = [Comment]()
    
    init() {
        cancellable =
        netService
            .getMultiple()
            .catch { _ in Just((self.posts, self.comments))}
            .receive(on: RunLoop.main)
            .sink { (posts, comments) in
                self.posts = posts
                self.comments = comments
        }
    }
}

extension ZipViewModel {
    func filterCommentsByPost(for post: Post) -> [Comment] {
        comments
        .lazy
            .filter { $0.postId == post.id }
    }
}
