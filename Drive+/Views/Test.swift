//
//  Test.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 3/8/23.
//

import SwiftUI
import UIKit

struct RepresentedMyView: UIViewRepresentable {
    typealias UIViewType = UITextView
//    var body: Never
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView(frame: CGRect(x: 20.0, y: 90.0, width: 250.0, height: 100.0))
        let t = "<p style='color:DodgerBlue;'>Lorem ipsum...</p>"
        view.text = "<html><body>\(t)</body></html>".htmlToString
        return view
    }
    func updateUIView(_ uiView: UITextView, context: Context) {
        
    }
}
