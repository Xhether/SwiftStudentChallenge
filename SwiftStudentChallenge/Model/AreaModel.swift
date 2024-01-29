//
//  AreaModel.swift
//  SwiftStudentChallenge
//
//  Created by Charles Liggins on 1/8/24.
//

import SwiftUI

struct AreaModel: Identifiable, Codable {
    var id: String
   // var color: Color
    var name: String
    
}


//extension Color: Codable {
//    private enum CodingKeys: CodingKey {
//        case red, green, blue, alpha
//    }
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let red = try container.decode(Double.self, forKey: .red)
//        let green = try container.decode(Double.self, forKey: .green)
//        let blue = try container.decode(Double.self, forKey: .blue)
//        let alpha = try container.decode(Double.self, forKey: .alpha)
//
//        self.init(red: red, green: green, blue: blue, opacity: alpha)
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(Double(redComponent), forKey: .red)
//        try container.encode(Double(greenComponent), forKey: .green)
//        try container.encode(Double(blueComponent), forKey: .blue)
//        try container.encode(Double(opacity), forKey: .alpha)
//    }
//    
//}
