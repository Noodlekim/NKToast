//
//  ContentView.swift
//  Example
//
//  Created by NoodleKim on 2023/09/03.
//

import SwiftUI
import NKToast

struct ContentView: View {
    @State private var showForTop = false
    @State private var showForCenter = false
    @State private var showForBottom = false

    var body: some View {
        VStack(spacing: 8) {
            Button("TOP") {
                showForTop.toggle()
            }
            .padding(.vertical)
            .frame(width: 100)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.cyan,lineWidth: 3)
            )

            Button("Center") {
                showForCenter.toggle()
            }
            .padding(.vertical)
            .frame(width: 100)
            .overlay(
                RoundedRectangle(cornerRadius:  12)
                    .stroke(.cyan,lineWidth: 3)
            )
            Button("Bottom") {
                showForBottom.toggle()
            }
            .padding(.vertical)
            .frame(width: 100)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.cyan,lineWidth: 3)
            )
        }
        .padding()
        .toast(messageType: .normal("A message for top"), position: .top, showToast: $showForTop)
        .toast(messageType: .normal("A message for center"), position: .center, showToast: $showForCenter)
        .toast(messageType: .normal("A message for bottom"), position: .bottom, showToast: $showForBottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
