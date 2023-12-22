//
//  Utils.swift
//  WeatherApp
//
//  Created by Yazmin Carmona Barrera on 22/12/23.
//

import Foundation

protocol JSONDescription: Encodable {
    var description: String { get }
}

extension JSONDescription {
    var description: String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let data = try encoder.encode(self)
            if let jsonString = String(data: data, encoding: .utf8) {
                return jsonString
            }
        } catch {
            return "Error al codificar la estructura a JSON: \(error)"
        }

        return "No se pudo convertir la estructura a JSON"
    }
}
