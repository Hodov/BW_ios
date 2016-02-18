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
    var postLink : String!
    var postIMGLink : String!
    
    init(id : Int, title: String, link : String, imgLink : String) {
        postId = id
        postTitle = title
        postLink = link
        postIMGLink = imgLink
    }
    
}