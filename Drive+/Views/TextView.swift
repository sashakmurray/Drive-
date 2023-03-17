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
    @State var range = NSRange(location: 0, length: 0)

    func makeUIView(context: Context) -> UITextView {
        view.attributedText = text
        view.textColor = UIColor.cyan
        view.font = UIFonts.medium
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
    
    func setItalics() {
        self.text.addAttribute(NSAttributedString.Key.obliqueness, value: 0.3, range: self.view.selectedRange)
        self.view.attributedText = self.text
        self.view.font = UIFonts.medium
    }
}
