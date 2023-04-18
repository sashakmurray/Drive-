//
//  TextView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 3/9/23.
//

import SwiftUI
import UIKit

struct TextView: UIViewRepresentable {
    @Binding var text: NSMutableAttributedString
    let view = UITextView()
    @State var fonts: [Int: Font]
    
    init(text: Binding<NSMutableAttributedString>) {
        self._text = text
        self.fonts = [:]
        
//        if let URL = Bundle.main.url(forResource: "hello", withExtension: "rtf") {
//            if let string = try? NSAttributedString(url: URL, options: [.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil) {
////                view.attributedText = string
//                self.text = string.mutableCopy() as! NSMutableAttributedString
//                for i in 0..<string.length {
//                    print(i)
//                    for attr in self.text.attributes(at: i, effectiveRange: nil) {
//                        if attr.key.rawValue == "NSFont" {
//                            self.fonts[i] = Font(attr.value as! CTFont)
//                            self.text.addAttribute(NSAttributedString.Key.font, value: attr.value as! UIFont, range: NSRange(location: i, length: 1))
//                        }
//                    }
//                }
//            }
//        }
    }

    func makeUIView(context: Context) -> UITextView {
        view.font = UIFonts.medium
        view.attributedText = text
//        print(view.attributedText)
        self.text = view.attributedText.mutableCopy() as! NSMutableAttributedString
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = text
        uiView.font = UIFonts.medium
    }

    func setDiffColor(color: UIColor) {
        self.text.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: self.view.selectedRange)
        self.view.attributedText = self.text
        self.view.font = UIFonts.medium
    }
    
    func setHighlight(color: UIColor) {
        self.text.addAttribute(NSAttributedString.Key.backgroundColor, value: color, range: self.view.selectedRange)
        self.view.attributedText = self.text
        self.view.font = UIFonts.medium
    }
    
    func setItalics() {
        var value = 0.3
        for attr in self.text.attributes(at: self.view.selectedRange.lowerBound, effectiveRange: nil) {
            if attr.key.rawValue == "NSObliqueness" && attr.value as! Double == 0.3 {
                value = 0
            }
        }
        self.text.addAttribute(NSAttributedString.Key.obliqueness, value: value, range: self.view.selectedRange)
        self.view.attributedText = self.text
        self.view.font = UIFonts.medium
    }
    
    func setUnderline() {
        var value = NSUnderlineStyle.single.rawValue
        for attr in self.text.attributes(at: self.view.selectedRange.lowerBound, effectiveRange: nil) {
            if attr.key.rawValue == "NSUnderline" && attr.value as! Int == NSUnderlineStyle.single.rawValue {
                value = 0
            }
        }
        self.text.addAttribute(NSAttributedString.Key.underlineStyle, value: value, range: self.view.selectedRange)
        self.view.attributedText = self.text
        self.view.font = UIFonts.medium
    }
    
    func checkAttribute(key: NSAttributedString.Key) -> Bool {
        for attr in self.text.attributes(at: self.view.selectedRange.lowerBound, longestEffectiveRange: nil, in: self.view.selectedRange) {
            if attr.key == key {
                switch(key.rawValue) {
                case "NSUnderline":
                    return attr.value as! Int == NSUnderlineStyle.single.rawValue
                case "NSObliqueness":
                    return attr.value as! Double == 0.3
                case "backgroundColor":
                    return true
                case "foregroundColor":
                    return true
                default:
                    return false
                }
            }
        }
        return false
    }
}
