//
//  LiveData.swift
//  WeatherApp
//
//  Created by Yazmin Carmona Barrera on 22/12/23.
//

import Foundation
import UIKit

class LiveData<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(self.value)
    }
    
    var value: T {
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ v: T) {
        self.value = v
    }
    
    func release() {
        self.listener = nil
    }
}
