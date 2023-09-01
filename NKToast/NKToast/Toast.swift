//
//  Toast.swift
//  NKToast
//
//  Created by NoodleKim on 2023/09/01.
//

import SwiftUI

struct Toast: ViewModifier {
    enum MessageType {
        case normal(String)
        case error(String)

        var message: String {
            switch self {
            case let .normal(message):
                return message
            case let .error(message):
                return message
            }
        }

        var backgroundColor: Color {
            switch self {
            case .normal:
                return Color(hex: "#20C8BE")
            case .error:
                return Color.red
            }
        }
    }

    enum Position {
        case top
        case center
        case bottom
    }

    let messageType: MessageType
    let duration: UInt64
    let position: Position

    @Binding var showToast: Bool

    init(messageType: MessageType, duration: UInt64 = 2, position: Position = .top, showToast: Binding<Bool>) {
        self.messageType = messageType
        self.duration = duration
        self.position = position
        _showToast = showToast
    }

    func body(content: Content) -> some View {
        VStack {
            switch position {
            case .top:
                VStack {
                    if showToast {
                        toastView(message: messageType.message)
                        Spacer()
                    }
                    content
                }
            case .bottom:
                ZStack {
                    content
                    if showToast {
                        VStack {
                            Spacer()
                            toastView(message: messageType.message)
                        }
                    }
                }
            case .center:
                ZStack {
                    content
                    if showToast {
                        toastView(message: messageType.message)
                    }
                }
            }
        }
        .padding(.horizontal)
        .onChange(of: showToast, perform: { isShown in
            guard isShown else { return }
            Task {
                try await Task.sleep(nanoseconds: duration * NSEC_PER_SEC)
                showToast = false
            }
        })
        .animation(.easeInOut(duration: 0.3), value: showToast)
    }

    func toastView(message: String) -> some View {
        HStack {
            Text(message)
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(.white)
            Spacer()
        }
        .foregroundColor(.primary)
        .padding(.vertical, 14)
        .padding(.horizontal)
        .background(messageType.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

extension View {
    func toast(messageType: Toast.MessageType, position: Toast.Position, showToast: Binding<Bool>) -> some View {
        return modifier(Toast(messageType: messageType, position: position, showToast: showToast))
    }
}
