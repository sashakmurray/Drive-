//
//  SpreadsheatView.swift
//  Drive+
//
//  Created by Nathan Donagi (student LM) on 4/20/23.
//

import SwiftUI

struct CellView: View {
    @Binding var value: String
    var body: some View {
        TextField("", text: $value)
            .padding()
            .background(Color.white)
    }
}

struct SpreadsheetView: View {
    @Binding var spreadsheet_metadata: FileMetadata
    @StateObject var spreadsheet: Spreadsheet = Spreadsheet(name: "Loading")
    
    var body: some View {
        ZStack {
            
            Color.gray.opacity(0.5).ignoresSafeArea(.all)
            
            VStack {
                FileMenuView(file: spreadsheet as File)
                ScrollView {
                    VStack(spacing:2) {
                        ForEach(0..<spreadsheet.content.count) { i in
                            HStack(spacing:2) {
                                CellView(value: $spreadsheet.content[i].a)
                                CellView(value: $spreadsheet.content[i].b)
                                CellView(value: $spreadsheet.content[i].c)
                                CellView(value: $spreadsheet.content[i].d)
                            }
                        }
                    }
                }.ignoresSafeArea(.all)
            }.task{
                await spreadsheet.getData(metadata: spreadsheet_metadata)
            }
        }
    }
}
    //struct SpreadsheetView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        SpreadsheatView()
    //    }
    //}
