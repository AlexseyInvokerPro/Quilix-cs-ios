//
//  Post.swift
//  Quilix-cs-ios
//
//  Created by Алексей Авдейчик on 1.02.22.
//

import Foundation

struct Post: Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
