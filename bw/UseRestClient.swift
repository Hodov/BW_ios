//
//  UseRestClient.swift
//  bw
//
//  Created by Андрей Скороходов on 15.02.16.
//  Copyright © 2016 Андрей Скороходов. All rights reserved.
//

import Foundation


class UseRestClient {
    
    
    
    func sendRequest()-> data {
        
        let url = NSURL(string: "http://budgetworld.ru/wp-json/wp/v2/posts")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, responce, error) in
            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
        }
        task.resume()
        
        return data
        
    }
    
    
    func getData() {
        
        sendRequest()
        
    }
    
    func saveData() {
        
        
    }
    
    
    
}