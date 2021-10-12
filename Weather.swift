//
//  Weather.swift
//  Clima
//
//  Created by 이은덕 on 2021/10/11.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct Coord:Codable {
    let lat: Float
    let lon: Float
}

struct Weather: Codable {
    let id: Int
    let main: String?
    let description: String?
    let icon: String?
}
struct WeatherMain: Codable {
        let temp: Float?
        let feels_like: Float?
        let temp_min: Float?
        let temp_max: Float?
        let pressure: Float?
        let humidity: Float?
}

struct WeatherData: Codable {
    let coord: Coord?
    let weather: [Weather]
    let base: String?
    let main: WeatherMain?
    let name: String?
    
    var conditionName:String {
        switch weather[0].id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.now"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
    var tempDecimalString: String? {
            if let safeMain = main {
                return String(format: "%.0f", safeMain.temp!)
            }
            return nil;
    }
}
