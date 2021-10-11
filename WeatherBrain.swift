//
//  WeatherData.swift
//  Clima
//
//  Created by 이은덕 on 2021/10/11.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherBrain {
    
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=2e46d3899d3ca08b0137e22b2e4857b9"
    var weatherData: WeatherData?
    
    mutating func fetchWeather(_ cityName:String) {
        let urlString = weatherUrl + "&q=\(cityName)"
        requestWeather(urlString)
    }
    
    mutating func requestWeather(_ urlString: String) {
        let url = URL(string: urlString)
        if let safeUrl = url {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: safeUrl, completionHandler:  {
                 (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    let decoder = JSONDecoder()
                    self.weatherData = try? decoder.decode(WeatherData.self, from: safeData)
                }
                
            })
            task.resume()
        }
    }
}
