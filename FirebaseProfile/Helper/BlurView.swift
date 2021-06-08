//
//  BlurView.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 5.06.21.
//

import SwiftUI

struct BlurViewLight: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialLight))
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct BlurViewDark: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
