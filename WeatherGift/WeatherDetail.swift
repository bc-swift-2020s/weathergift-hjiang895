//
//  WeatherDetail.swift
//  WeatherGift
//
//  Created by Hannah Jiang on 3/23/20.
//  Copyright © 2020 Hannah Jiang. All rights reserved.
//

import Foundation

class WeatherDetail: WeatherLocation {
    
    struct Result: Codable {
        var timezone: String
        var currently: Currently
        var daily: Daily
    }
    
    struct Currently: Codable {
        var temperature: Double
    }
    
    struct Daily: Codable {
        var summary: String
        var icon: String
    }
    
    var timezone = ""
    var temperature = 0
    var summary = ""
    var icon = ""
    
    func getData(completed: @escaping () -> ()){
        let coordinates = "\(latitude),\(longitude)"
        let urlString = "\(APIurls.darkSkyURL)\(APIKeys.darkSkyKey)/\(coordinates)"
        print("We are accessing the url \(urlString)")
        guard let url = URL(string: urlString) else{
            print("Error: Could not create a URL from \(urlString)")
            completed()
            return
        }
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                
                let result = try JSONDecoder().decode(Result.self, from: data!)
                self.timezone = result.timezone
                self.temperature = Int(result.currently.temperature.rounded())
                self.summary = result.daily.summary
                self.icon = result.daily.icon
            }catch{
                print("JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
        
    }
}
