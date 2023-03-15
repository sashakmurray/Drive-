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

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.attributedText = text
        view.textColor = UIColor.cyan
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = text
        uiView.font = UIFonts.medium
        print(text)
    }

    func setDiffColor(color: UIColor, range: NSRange) {
//        let attText = NSMutableAttributedString(string: self.text!)
        self.text.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
//        self.text = attText
    }
}
