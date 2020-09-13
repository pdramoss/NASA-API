//
//  Theme.swift
//  Nasa API
//
//  Created by Pedro Ramos on 12/09/20.
//  Copyright © 2020 Pedro Ramos. All rights reserved.
//

import Foundation
import SwiftUI

struct Theme {
    enum BaseColor: String {
        case actionBlue = "ActionBlue"
        case backgroundPrimary = "BackgroundPrimary"
        case backgrounsSecondary = "BackgrounsSecondary"
        case black = "Black"
        case danger = "Danger"
        case disabled = "Disabled"
        case rowHover = "RowHover"
        case rowSelection = "RowSelection"
        case success = "Success"
        case textPrimary = "TextPrimary"
        case textSecondary = "TextSecondary"
        case white = "White"
        
        var color: Color {
            return Color(self.rawValue)
        }
    }
    
    enum Typography {
        enum Heading: CGFloat {
            case heading01 = 32
            case heading02 = 28
            case heading03 = 22
            case heading04 = 18
            case heading05 = 16
            case heading06 = 14
        }
        
        enum Paragraph: CGFloat {
            case paragraph01 = 14
            case paragraph02 = 13
            case paragraph03 = 12
            case paragraph04 = 11
            case paragraph05 = 10
        }
    }
}
