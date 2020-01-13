//
//  NetService.swift
//  Multiple Requests by Combine
//
//  Created by Dmitry Novosyolov on 13/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import Foundation
import Combine

final class NetService {
    
    private enum UrlType: String {
        case posts = "https://jsonplaceholder.typicode.com/posts"
        case comments = "https://jsonplaceholder.typicode.com/comments"
    }
    
    func getMultiple() -> AnyPublisher<([Post], [Comment]), Error>{
        guard
            let postsURL = URL(string: UrlType.posts.rawValue),
            let commentsURL = URL(string: UrlType.comments.rawValue)
            else { fatalError("Invalid URL's")}
        let postsPublisher =
            URLSession.shared.dataTaskPublisher(for: postsURL)
                .map { $0.data }
                .decode(type: [Post].self, decoder: JSONDecoder())
        let commentsPublisher =
            URLSession.shared.dataTaskPublisher(for: commentsURL)
                .map { $0.data }
                .decode(type: [Comment].self, decoder: JSONDecoder())
        return
            Publishers.Zip(postsPublisher, commentsPublisher)
                .eraseToAnyPublisher()
    }
}
