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
            Color.black.opacity(0.2).ignoresSafeArea(.all)
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Group {
                    Text("Drive")
                        .foregroundColor(.purple) +
                    Text("+")
                        .foregroundColor(.red)
                        .fontWeight(.heavy)
                        
                }
                    .font(Fonts.omega_large)
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
