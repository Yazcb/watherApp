//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Yazmin Carmona Barrera on 22/12/23.
//

import Foundation

struct Coordenatees: Codable {
    let lon: Double
    let lat: Double
    
    enum CodingKeys: String, CodingKey {
        case lon
        case lat
    }
}

struct WeatherModel: Codable  {
    let id: Int64
    let main: String
    let description: String
    let icon: String
}

struct MainModel: Codable  {
    let temp:Double
    let feelsLike:Double
    let tempMin:Double
    let tempMax:Double
    let pressure:Double
    let humidity:Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
    
   
}

struct WindModel : Codable {
    let speed: Double
    let deg: Double

    enum CodingKeys: String, CodingKey {
        case speed
        case deg
    }
}

struct CloudsModel: Codable {
    let all: Int

    enum CodingKeys: String, CodingKey {
        case all
    }
}

struct Sys: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: TimeInterval
    let sunset: TimeInterval

    enum CodingKeys: String, CodingKey {
        case type
        case id
        case country
        case sunrise
        case sunset
    }
}

struct WeatherResponseModel: Codable  {
    let coord: Coordenatees
    let weather: [WeatherModel]
    let base: String
    let main: MainModel
    let visibility: Int
    let wind: WindModel
    let clouds: CloudsModel
    let dt: Int
    let sys: Sys
    let id: Int64
    let name: String
    let cod: Int
    
    enum CodingKeys: String, CodingKey {
        case coord
        case weather
        case base
        case main
        case visibility
        case wind
        case clouds
        case dt
        case sys
        case id
        case name
        case cod
    }
}


