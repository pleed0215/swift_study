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
}
