//
//  Posts.swift
//  bw
//
//  Created by Андрей Скороходов on 16.02.16.
//  Copyright © 2016 Андрей Скороходов. All rights reserved.
//

import Foundation

class Posts {

    var posts : [Post]!
    var loading : Bool = false
    var currentPage : Int!
    
    init() {
        posts=[]
        currentPage = 1
        loading = true
        getData(currentPage)
    }
    
    func getData(page: Int) {
        let page = page
        self.sendRequest(page)
    }
    //getData

    func sendRequest(page: Int) {
        
        let url = NSURL(string: "http://budgetworld.ru/wp-json/wp/v2/posts/?page="+String(page))
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url!, completionHandler: {
            (data, responce, error) -> Void in
            //do something
            
            do {
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSArray
                        self.saveData(jsonData)
                        self.loading = false
                
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
        
        NSNotificationCenter.defaultCenter().postNotificationName("reload", object : nil)
        
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
    
    func getTitle(num: Int) -> String {
        
        if ((posts) != nil) {
            return posts[num].postTitle
        }
        else {
            return ""
        }
    }
    
    
}