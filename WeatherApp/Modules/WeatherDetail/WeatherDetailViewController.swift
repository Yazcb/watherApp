//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Yazmin Carmona Barrera on 22/12/23.
//

import Foundation
import UIKit
import CoreLocation

class WeatherDetailViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var weatherView: DetailCustomView!
    @IBOutlet weak var degreeView: DetailCustomView!
    @IBOutlet weak var temperatureView: DetailCustomView!
    @IBOutlet weak var windView: DetailCustomView!
    @IBOutlet weak var locationView: DetailCustomView!
    @IBOutlet weak var stackWeatherView: UIStackView!
    @IBOutlet weak var locationContainerView: UIView!
    @IBOutlet weak var stackLoader: UIStackView!
    @IBOutlet weak var lblInfo: UILabel!
    
    var locationManager: CLLocationManager!
    
    private var viewModel: WeatherDetailViewModel = WeatherDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subcribe()
        setupRoundStyleView()
        setupLocationManager()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.stackLoader.isHidden = false
        self.stackWeatherView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkLocationAuthorization()
    }
    
    func getWeatherInfo()  {
        self.viewModel.getWeatherByLocation()
    }
    
    func setupRoundStyleView() {
       locationContainerView.layer.cornerRadius = 10.0
        locationContainerView.layer.shadowColor = UIColor.gray.cgColor
        locationContainerView.layer.shadowOpacity = 0.5
        locationContainerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        locationContainerView.layer.shadowRadius = 4.0
   }
}


extension WeatherDetailViewController {
    func subcribe() {
        self.viewModel.isResponseData.bind { isSuccessResponse in
            if isSuccessResponse {
                let weatherData = self.viewModel.getWeatherData()
                self.weatherView.initData(data: weatherData)
                
                
                let degreeData = self.viewModel.getClouds()
                self.degreeView.initData(data: degreeData)
                
                let temperatureData = self.viewModel.getTemperature()
                self.temperatureView.initData(data: temperatureData)
                
                let windData = self.viewModel.getWind()
                self.windView.initData(data: windData)
                
                let locationData = self.viewModel.getLocation()
                self.locationView.initData(data: locationData)
                
               
            } else {
                self.stackWeatherView.isHidden = true
                self.lblInfo.text = self.viewModel.error
            }
        }
    }
    
    
    func fillView(data: CustomViewData, view: DetailCustomView) {
        self.weatherView.initData(data: data)
    }
}


extension WeatherDetailViewController {
    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    
    func checkLocationAuthorization()  {
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            self.dismiss(animated: true) {
                self.showAlertWithSettings()
                
            }
        @unknown default:
            fatalError("Error en autorizacion")
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        self.viewModel.setCoordenates(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        self.viewModel.getWeatherByLocation()
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func showAlertWithSettings() {
        let alert = UIAlertController(
            title: "Permisos de ubicación deshabilitados",
            message: "Para poder obtener los datos del clima con tu ubicación habilita los permisos en Configuración.",
            preferredStyle: .alert
        )
        
        let settingsAction = UIAlertAction(title: "Configuración", style: .default) { _ in
            // Abrir la configuración de la aplicación
            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
