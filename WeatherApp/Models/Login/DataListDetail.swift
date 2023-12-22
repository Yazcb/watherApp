//
//  DataListDetail.swift
//  WeatherApp
//
//  Created by Yazmin Carmona Barrera on 22/12/23.
//

import Foundation

struct DataListDetail: Codable {
    let id: Int
    let value: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case value
    }
}

