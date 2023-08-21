//
//  Fonts.swift
//  ffffffff
//
//  Created by Jamil Jabiyev on 15.08.23.
//

import UIKit

// MARK: - Fonts

enum FontType: String {
    case regular = "Regular"
    case medium = "Medium"
    case semibold = "SemiBold"
    case bold = "Bold"
}

struct Fonts {
    static func style(type: FontType, size: CGFloat) -> UIFont? {
        UIFont(name: "Poppins-\(type.rawValue)", size: size)
    }
}

// MARK: - Colors

enum ColorType: String {
    case black = "Black"
    case gray = "Gray"
    case lightGray = "Light Gray"
    case mediumGray = "Medium Gray"
    case primary = "Primary"
    case secondary = "Secondary"
    case backgroundColorView = "Background Color View"
}

struct Colors {
    static func getColor(type: ColorType) -> UIColor? {
        UIColor(named: type.rawValue)
    }
}

// MARK: - Icons Symbols

enum IconType: String {
    case alert = "Alert"
    case chevron = "Chevron"
    case dataPie = "Data Pie"
    case dismissCircle = "Dismiss Circle"
    case gift = "Gift"
    case payment = "Payment"
    case receipt = "Receipt"
    case search = "Search"
    case send = "Send"
    case settings = "Settings"
    case table = "Table"
    case wallet = "Wallet"
    case mastercard = "Mastercard"
    case chevronRight = "Chevron Right"
    case homeIndicator = "Home Indicator"
}

struct Icons {
    static func getIcon(type: IconType) -> UIImage? {
        UIImage(named: type.rawValue)
    }
}

// MARK: - Images

enum ImageTypes: String {
    case avatar1 = "Avatar-1"
    case avatar2 = "Avatar-2"
    case avatar3 = "Avatar-3"
    case avatar4 = "Avatar-4"
    case avatar5 = "Avatar-5"
    case avatar6 = "Avatar-6"
    case avatar7 = "Avatar-7"
    case avatar8 = "Avatar-8"
    case avatar9 = "Avatar-9"
    case done = "Done"
}

struct Images {
    static func getImage(type: ImageTypes) -> UIImage? {
        UIImage(named: type.rawValue)
    }
}
