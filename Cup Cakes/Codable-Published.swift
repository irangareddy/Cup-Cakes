//
//  Codable-Published.swift
//  Cup Cakes
//
//  Created by RANGA REDDY NUKALA on 20/09/20.
//

import Foundation
// Errors
// Type 'User' does not conform to protocol 'Decodable'
// Type 'User' does not conform to protocol 'Encodable'

enum CodingKeys: CodingKey {
    case name
}

class User: ObservableObject, Codable {
    @Published var name = "Ranga Reddy"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
