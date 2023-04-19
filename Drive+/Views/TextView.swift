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
    
    init(text: Binding<NSMutableAttributedString>) {
        self._text = text
    }

    func makeUIView(context: Context) -> UITextView {
        view.attributedText = text
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        print("hewwo")
        uiView.attributedText = text
    }

    func setDiffColor(color: UIColor) {
        self.text.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: self.view.selectedRange)
        self.view.attributedText = self.text
    }
    
    func setHighlight(color: UIColor) {
        self.text.addAttribute(NSAttributedString.Key.backgroundColor, value: color, range: self.view.selectedRange)
        self.view.attributedText = self.text
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
    }
    
    func pushData() -> Data {
        let rtfData: Data = Data()
        do {
            let rtfData = try self.text.data(from: .init(location: 0, length: self.text.length), documentAttributes: [.documentType: NSAttributedString.DocumentType.rtf])
            print(rtfData)
        } catch {
            print(error)
        }
        return rtfData
    }
}
