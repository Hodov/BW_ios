//
//  Posts.swift
//  bw
//
//  Created by Андрей Скороходов on 16.02.16.
//  Copyright © 2016 Андрей Скороходов. All rights reserved.
//

import Foundation

class Posts {

    var posts: [Post]!
    
    init() {
        posts=[]
        getData(1)
    }
    
    func getData(page: Int) {
        let page = page
        self.sendRequest(page)
    }
    //getData

    func sendRequest(page: Int) {
        
        let url = NSURL(string: "http://budgetworld.ru/wp-json/wp/v2/posts")
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url!, completionHandler: {
            (data, responce, error) -> Void in
            //do something
            
            do {
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSArray
                        self.saveData(jsonData)
            }
            catch {
                //handle error
            }
            
        })
        dataTask.resume()
    }
    //sendRequest
    
    
    func saveData(jsonData : NSArray) {
        for i in jsonData {
            let id = i["id"] as! Int
            let titleJS = i["title"] as! NSDictionary
            let title = titleJS["rendered"] as! String
            self.addPost(id, title: title)
        }
        
    }
    //saveData
    
    func addPost(id : Int, title : String) {
        let id = id
        let title = title
        let post = Post(id: id, title: title)
        posts.append(post)
        
    }
    //addPost
    
    func countPosts() -> Int {
        
        if ((posts) != nil) {
            return posts.count
        }
        else {
            return 0
        }
    }
    
    
    
}