//
//  UseRestClient.swift
//  bw
//
//  Created by Андрей Скороходов on 15.02.16.
//  Copyright © 2016 Андрей Скороходов. All rights reserved.
//

import Foundation


class UseRestClient {
    
    
    
    func sendRequest(page: Int) {
        
        let url = NSURL(string: "http://budgetworld.ru/wp-json/wp/v2/posts")
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url!, completionHandler: {
            (data, responce, error) -> Void in
            //do something
            
            do {
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSArray
                
                self.saveData(jsonData)
                
                //do stuff
            }
            catch {
                //handle error
            }
            
        })
        dataTask.resume()
    }
    //sendRequest
    
    func getData() {
        
        self.sendRequest(1)
    }
    //getData
    
    func saveData(jsonData : NSArray) {
        
        for i in jsonData {
            let titleJS = i["title"] as! NSDictionary
            print(titleJS["rendered"])
        }
       
    }
    //saveData
    
    
} //UseRestClient