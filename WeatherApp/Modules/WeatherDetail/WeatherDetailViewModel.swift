//
//  WeatherDetailViewModel.swift
//  WeatherApp
//
//  Created by Yazmin Carmona Barrera on 22/12/23.
//

import Foundation

class WeatherDetailViewModel {
    lazy var isResponseData: LiveData<Bool> = LiveData(false)
    
    var weatherService = WeatherService()
    var weatherResponse: WeatherResponseModel?
    var currentLocation: Coordenatees?
    var error: String?
    
    init() {
        weatherService.delegate = self
    }
    
    
    func getWeatherByLocation() {
        if let coor  = self.currentLocation {
            self.weatherService.getWeather(coordenates: coor) { response in
                self.weatherResponse = response
                self.isResponseData.value = true
            }
        }
    }
    
    func getWeatherData() -> CustomViewData {
        if let response = weatherResponse, let weather = response.weather.first {
            return CustomViewData(firstValue:"Weather", secondvalue: weather.description, icon: "ic_weather")
        }
        return CustomViewData(firstValue: "", secondvalue: "", icon: "")
    }
    
    func getClouds() -> CustomViewData {
        if let response = weatherResponse {
            return CustomViewData(firstValue: "Degree", secondvalue: "\(response.clouds.all)", icon: "ic_clouds")
        }
        return CustomViewData(firstValue: "", secondvalue: "", icon: "")
    }
    
    func getTemperature() -> CustomViewData {
        if let response = weatherResponse {
            return CustomViewData(firstValue: "\(response.main.tempMin)", secondvalue: "\(response.main.tempMax)", icon: "ic_temp")
        }
        return CustomViewData(firstValue: "", secondvalue: "", icon: "")
    }
    
    func getWind() -> CustomViewData {
        if let response = weatherResponse {
            return CustomViewData(firstValue: "Wind", secondvalue: "\(response.wind.speed) / \(response.wind.deg)", icon: "ic_wind")
        }
        return CustomViewData(firstValue: "", secondvalue: "", icon: "")
    }
    
    func getLocation() -> CustomViewData {
        if let response = weatherResponse {
            return CustomViewData(firstValue: response.name, secondvalue: "Country", icon: "ic_location")
        }
        return CustomViewData(firstValue: "", secondvalue: "", icon: "")
    }
    
    func setCoordenates(latitude: Double, longitude: Double) {
        self.currentLocation = Coordenatees(lon: longitude, lat: latitude)
    }
}

extension WeatherDetailViewModel: BaseServiceDelegate {
    func processFailWitError(code: Int, error: String) {
        self.error = "Ocurrio un error"
        self.isResponseData.value = false
    }
}

