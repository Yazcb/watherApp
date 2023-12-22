//
//  BaseService.swift
//  WeatherApp
//
//  Created by Yazmin Carmona Barrera on 22/12/23.
//

import Foundation

protocol BaseServiceDelegate {
    func processFailWitError(code: Int, error: String)
}

class BaseService: ServiceManagerDelegate {
    let serviceManager = ServiceManager.shared()
    var delegate: BaseServiceDelegate?
    
    
    internal init() {
        serviceManager.delegate = self
    }
    
    func processFailWitError(code: Int, error: String) {
        self.delegate?.processFailWitError(code: code, error: error)
    }
    
}
