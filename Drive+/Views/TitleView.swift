//
//  TitleView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 4/20/23.
//

import SwiftUI

struct TitleView: View {
    @Binding var titleScreen: Bool
    var body: some View {
        ZStack {
            Color.blue.opacity(0.3).ignoresSafeArea(.all)
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text("Drive+")
                    .font(Fonts.omega_large)
                    .fontWeight(.bold)
                    .padding()
                
                
                Button {
                    titleScreen.toggle()
                } label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(Fonts.omega_large)
                        .foregroundColor(.purple)
                        .padding()
                }
            }
        }
    }
}

//struct TitleView_Previews: PreviewProvider {
//    static var previews: some View {
//        TitleView()
//    }
//}
