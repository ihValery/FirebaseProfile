//
//  BlurView.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 5.06.21.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialLight))
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
