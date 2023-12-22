//
//  ServiceManager.swift
//  WeatherApp
//
//  Created by Yazmin Carmona Barrera on 22/12/23.
//

import Foundation
import Alamofire


protocol ServiceManagerDelegate {
    func processFailWitError(code: Int, error: String)
}


class ServiceManager {
    
    var delegate: ServiceManagerDelegate?
    var manager: Session
   
    private static var sharedInstance: ServiceManager {
        let serviceManager = ServiceManager()
        return serviceManager
    }
    
    class func shared() -> ServiceManager {
        return sharedInstance
    }
    
    init() {
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            return config
        }()
        self.manager = Session(configuration: configuration)
    }
    
    
    func request<T:Decodable>(urlString: String, completionHandler: @escaping(T?) -> Void) {
        self.manager.request(urlString).validate().responseDecodable(of: T.self) { (response) in
            switch response.result {
                case .success(let data):
                completionHandler(data)
            case .failure(let error):
                self.delegate?.processFailWitError(code: response.response?.statusCode ?? -1, error: error.errorDescription ?? "")

            }
        }
    }
}
