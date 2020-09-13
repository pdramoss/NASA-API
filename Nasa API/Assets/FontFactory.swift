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
    func fontWithStyle(_ style: style, size: CGFloat) -> UIFont
    func fontWithStyle(_ style: style, size: CGFloat) -> Font
}

class FontFactory {
    enum StyleEnum: String {
        case Black
        case BlackItalic
        case Bold
        case BoldItalic
        case ExtraBold
        case ExtraBoldItalic
        case ExtraLight
        case ExtraLightItalic
        case Light
        case LightItalic
        case Medium
        case MediumItalic
        case Regular
        case RegularItalic
        case SemiBold
        case SemiBoldItalic
        case Thin
        case ThinItalic
    }
    
    typealias style = StyleEnum
    fileprivate let familyName = "Metropolis"
}

extension FontFactory: FontFactoryProtocol {
    
    func fontWithStyle(_ style: style, size: CGFloat) -> Font {
        let name = "\(familyName)-\(style.rawValue)"
        return Font.custom(name, size: size)
    }
    
    func fontWithStyle(_ style: style, size: CGFloat) -> UIFont {
        let name = "\(familyName)-\(style.rawValue)"
        guard let font = UIFont(name: name, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
}
