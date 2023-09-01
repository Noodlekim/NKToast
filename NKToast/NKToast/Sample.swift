//
//  Sample.swift
//  NKToast
//
//  Created by NoodleKim on 2023/09/01.
//

import SwiftUI

struct Sample: View {
    @State private var showToast = true
    var body: some View {
        Text("Hello, World!")
            .toast(messageType: .normal("It's a toast message!"), position: .top, showToast: $showToast)
    }
}

struct Sample_Previews: PreviewProvider {
    static var previews: some View {
        Sample()
    }
}
