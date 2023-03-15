//
//  Test2.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 3/9/23.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        let view = UIView()
        let label = UILabel()
        label.text = "Text"
        
        view.addSubview(label)
        self.view = view
    }
}

struct TextView: UIViewRepresentable {
    @Binding var text: NSMutableAttributedString

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.attributedText = text
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = text
        print(text)
    }

    func setDiffColor(color: UIColor, range: NSRange) {
//        let attText = NSMutableAttributedString(string: self.text!)
        self.text.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
//        self.text = attText
    }
}
