//
//  Currency.swift
//  Store
//
//  Created by Anton Khlomov on 17/03/2023.
//

import Foundation
enum Currency {
    case Dollar
    case Euro
    case Rubles
    
    var description: [String] {
        switch self {
        case .Dollar: return ["$"]
        case .Euro: return ["€"]
        case .Rubles: return ["₽"]
        }
    }
}
