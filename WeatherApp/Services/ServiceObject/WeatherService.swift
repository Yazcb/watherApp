//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Yazmin Carmona Barrera on 22/12/23.
//

import Foundation

class WeatherService: BaseService {
    
    let appId = ""
    
    override init() {
        super.init()
    }
    
    func getWeather(coordenates: Coordenatees, completion: @escaping(WeatherResponseModel?)-> Void) {
        let params: [String: Any] = [
            "lat": coordenates.lat,
            "lon": coordenates.lon,
            "appid": appId
        ]
        
        let urlString =  "https://api.openweathermap.org/data/2.5/weather"
        serviceManager.requestWithParams(urlString: urlString, params: params, completionHandler: completion)
    }
    
}
