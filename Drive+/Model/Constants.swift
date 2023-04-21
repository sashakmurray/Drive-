//
//  Constants.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 3/2/23.
//

import SwiftUI

struct UIFonts {
    static let small: UIFont = UIFont(name: "HelveticaNeue-Thin", size: 16) ?? UIFont.systemFont(ofSize: 16)
    static let medium: UIFont = UIFont(name: "HelveticaNeue-Thin", size: 20) ?? UIFont.systemFont(ofSize: 16)
    static let large: UIFont = UIFont(name: "HelveticaNeue-Thin", size: 25) ?? UIFont.systemFont(ofSize: 16)
    static let extra_large: UIFont = UIFont(name: "HelveticaNeue-Thin", size: 35) ?? UIFont.systemFont(ofSize: 16)
    static let omega_large: UIFont = UIFont(name: "HelveticaNeue", size: 70) ?? UIFont.systemFont(ofSize: 16)
}

struct Fonts {
    static let small = Font(UIFonts.small as CTFont)
    static let medium = Font(UIFonts.medium as CTFont)
    static let large = Font(UIFonts.large as CTFont)
    static let extra_large = Font(UIFonts.extra_large as CTFont)
    static let omega_large = Font(UIFonts.omega_large as CTFont)

}
