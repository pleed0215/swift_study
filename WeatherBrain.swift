//
//  WeatherData.swift
//  Clima
//
//  Created by 이은덕 on 2021/10/11.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherBrainDelegate {
    func didUpdateWeather(weather: WeatherData)
    func didFailWithError(_ error: Error)
}

struct WeatherBrain {
    
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=2e46d3899d3ca08b0137e22b2e4857b9&units=metric"
    var iconName: String?
    var delegate: WeatherBrainDelegate?
    
    func fetchWeather(_ cityName:String) {
        let urlString = weatherUrl + "&q=\(cityName)"
        requestWeather(urlString)
    }
    
    func requestWeather(_ urlString: String) {
        let url = URL(string: urlString)
        if let safeUrl = url {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: safeUrl, completionHandler:  {
                (data, response, error) in
                if let realError = error {
                    print(error!)
                    delegate?.didFailWithError(realError)
                    return
                }
                if let safeData = data {
                    guard let weatherData =  self.parseJSON(weatherData: safeData) else {
                        print("Fetching failed")
                        return
                    }
                    delegate?.didUpdateWeather(weather: weatherData)
                }
            })
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherData? {
        let decoder = JSONDecoder()
        do {
            let data =  try decoder.decode(WeatherData.self, from: weatherData)
            return data
        } catch {
            print(error)
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
