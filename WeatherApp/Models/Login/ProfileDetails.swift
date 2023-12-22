//
//  ProfileDetails.swift
//  WeatherApp
//
//  Created by Yazmin Carmona Barrera on 22/12/23.
//

import Foundation

struct ProfileDetails: Codable {
    let isProfileComplete: Bool
    let rating: Double
    
    enum CodingKeys: String, CodingKey {
        case isProfileComplete = "is_profile_complete"
        case rating
    }
}
