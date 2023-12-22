//
//  LoginModel.swift
//  WeatherApp
//
//  Created by Yazmin Carmona Barrera on 22/12/23.
//

import Foundation


struct LoginModel: Codable {
    let message: String
    let userId: Int
    let name: String
    let email: String
    let mobile: Int64
    let profileDetails: ProfileDetails
    let dataList: [DataListDetail]
    
    enum CodingKeys: String, CodingKey {
        case message
        case userId = "user_id"
        case name
        case email
        case mobile
        case profileDetails = "profile_details"
        case dataList = "data_list"
    }
    
}

extension LoginModel: JSONDescription {}
