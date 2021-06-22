//
//  DataModelManager.swift
//  Assignment1-Aliaksandr
//
//  Created by user182438 on 11/21/20.Amrinder Kaur
//  Copyright © 2020 user182483. All rights reserved.
//

import Foundation

class JSONManager {


func fetchJSONData( completionHandler : @escaping (CoursePackage)->Void )  {


            let url = URL(string: "https://raw.githubusercontent.com/kauramrinder/IOSjson/main/amrinder.json")!
                   
        
                   let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                       
                       
                       if let error = error {
                           print(error)
                           return
                       }
                       
                       
                       guard let httpResponse = response as? HTTPURLResponse,
                           (200...299).contains(httpResponse.statusCode)
                           else {
                               
                               if let httpResponse = response as? HTTPURLResponse {
                                   print("URL: \(httpResponse.url!.path )\nStatus code: \(httpResponse.statusCode)")
                               }
                               return
                       }
                       
                       
                       if let mimeType = httpResponse.mimeType,
                           mimeType.starts(with: "text/plain"),
                           let data = data {
                           
                           // Create and configure a JSON decoder
                           let decoder = JSONDecoder()
                           
                           do {
                            
                               let result = try decoder.decode(CoursePackage.self, from: data)
                               
                               
                               print(result.student)
                               
                                completionHandler(result)
                          
                               
                           }
                           catch {
                               print(error)
                           }
                       }
                   }
                   
                   task.resume()
              
        }
    
}
