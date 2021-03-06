//
//  BackgroundAnimation.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

//import SwiftUI
//
//struct BackgroundAnimation: View {
//    @State private var startAnimation: Bool = false
//    
//    var body: some View {
//        ZStack {
//            ForEach(1...5, id: \.self) { _ in
//                Circle()
//                    .fill(Color.blueEnd).opacity(.random(in: 0.3...0.4))
//                    .frame(width: .random(in: 50...200), height: .random(in: 50...200))
//                    .position(x: startAnimation ? .random(in: 0...getRect().width) : .random(in: 0...getRect().width),
//                              y: startAnimation ? .random(in: 0...250) : .random(in: 0...250))
//                    .animation(.linear(duration: 50).repeatCount(100, autoreverses: true))
//            }
//        }
//        .onAppear {
//            startAnimation.toggle()
//        }
//    }
//}
//
//struct BackgroundAnimation_Previews: PreviewProvider {
//    static var previews: some View {
//        BackgroundAnimation()
//    }
//}
