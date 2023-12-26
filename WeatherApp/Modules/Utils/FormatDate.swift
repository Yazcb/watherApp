//
//  FormatDate.swift
//  WeatherApp
//
//  Created by Yazmin Carmona Barrera on 25/12/23.
//

import Foundation


class FormatDate {
    enum FormatType: String {
        case militarHHmm = "HH:mm"
    }

    class func convertUnixToDate(_ unixTimestamp: TimeInterval, format: FormatType) -> String {
        let date = convertDate(unixTimestamp)
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        
        return dateFormatter.string(from: date)
    }
    
    private  class func convertDate(_ unixTimestamp: TimeInterval) -> Date {
        return  Date(timeIntervalSince1970: unixTimestamp)
    }
}
