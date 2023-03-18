//
//  Colors.swift
//  Store
//
//  Created by Anton Khlomov on 18/03/2023.
//
import Foundation
import UIKit

enum AssetsColor {
    case FonStore
    case FonTabBarStore
    case ColorButtonStore
    case FonTextFieldStore
    case BlueStore
    case WhiteStore
    case FonQuantityStore
    case BalackStore
    case ButtonTabBarStore
}
extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .FonStore:
            return  UIColor.rgb(red: 249, green: 247, blue: 255)
        case .FonTabBarStore:
            return  UIColor.rgb(red: 228, green: 228, blue: 228)
        case .ColorButtonStore:
            return  UIColor.rgb(red: 78, green: 85, blue: 215)
        case .FonTextFieldStore:
            return  UIColor.rgb(red: 232, green: 232, blue: 232)
        case .BlueStore:
            return  UIColor.rgb(red: 143, green: 180, blue: 177)
        case .WhiteStore:
            return  UIColor.rgb(red: 255, green: 255, blue: 255)
        case .FonQuantityStore:
            return  UIColor.rgb(red: 24, green: 23, blue: 38)
        case .BalackStore:
            return  UIColor.rgb(red: 0, green: 0, blue: 0)
        case .ButtonTabBarStore:
            return  UIColor.rgb(red: 144, green: 144, blue: 144)
        }
    }
}
