//
//  LoginService.swift
//  WeatherApp
//
//  Created by Yazmin Carmona Barrera on 22/12/23.
//

import Foundation

class LoginService: BaseService {
    
    override init() {
        super.init()
    }
    
    func initLogin(completion: @escaping(LoginModel?)-> Void) {
        let url = "https://run.mocky.io/v3/94dec98f-c995-4629-8109-57421e427fe8"
        serviceManager.request(urlString: url, completionHandler: completion)
    }
                               
}
