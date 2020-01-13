//
//  Model.swift
//  Multiple Requests by Combine
//
//  Created by Dmitry Novosyolov on 13/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let title, body: String
}

struct Comment: Codable, Identifiable {
    let id, postId: Int
    let name, email, body: String
}
