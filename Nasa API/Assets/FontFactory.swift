//
//  FontFactory.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation
import SwiftUI

protocol FontFactoryProtocol: class {
    associatedtype style
    static func fontWithStyle(_ style: style, size: CGFloat) -> Font
    static func fontWithStyle(_ style: style, _ heading: Theme.Typography.Heading) -> Font
    static func fontWithStyle(_ style: style, _ paragraph: Theme.Typography.Paragraph) -> Font
}

class FontFactory {
    enum StyleEnum: String {
        case black = "Black"
        case blackItalic = "BlackItalic"
        case bold = "Bold"
        case boldItalic = "BoldItalic"
        case extraBold = "ExtraBold"
        case extraBoldItalic = "ExtraBoldItalic"
        case extraLight = "ExtraLight"
        case extraLightItalic = "ExtraLightItalic"
        case light = "Light"
        case lightItalic = "LightItalic"
        case medium = "Medium"
        case mediumItalic = "MediumItalic"
        case regular = "Regular"
        case regularItalic = "RegularItalic"
        case semiBold = "SemiBold"
        case semiBoldItalic = "SemiBoldItalic"
        case thin = "Thin"
        case thinItalic = "ThinItalic"
    }
    
    typealias style = StyleEnum
    fileprivate static let familyName = "Metropolis"
}

extension FontFactory: FontFactoryProtocol {
    static func fontWithStyle(_ style: style, size: CGFloat) -> Font {
        let name = "\(familyName)-\(style.rawValue)"
        Logger.info(name)
        return Font.custom(name, size: size)
    }
    
    static func fontWithStyle(_ style: StyleEnum, _ heading: Theme.Typography.Heading) -> Font {
        fontWithStyle(style, size: heading.rawValue)
    }
    
    static func fontWithStyle(_ style: StyleEnum, _ paragraph: Theme.Typography.Paragraph) -> Font {
        fontWithStyle(style, size: paragraph.rawValue)
    }
}
