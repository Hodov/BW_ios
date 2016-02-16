//
//  Post.swift
//  bw
//
//  Created by Андрей Скороходов on 16.02.16.
//  Copyright © 2016 Андрей Скороходов. All rights reserved.
//

import Foundation


class Post {
    
    var postId : Int!
    var postTitle : String!
    
    init(id : Int, title: String) {
        postId = id
        postTitle = title
    }
    
}