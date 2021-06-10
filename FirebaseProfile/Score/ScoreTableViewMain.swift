//
//  ScoreTableViewMain.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct ScoreTableViewMain: View {
    @State private var isAnimation = false
    
    var body: some View {
        ZStack {
//            Button("Анимация") {
//                isAnimation.toggle()
//            }.zIndex(1)
//            .foregroundColor(.pink)
//            .offset(x: getRect().width - 270, y: -getRect().height / 2 + 50)
            
            LinearGradient(gradient: Gradient(colors: [.blueStart, .blueEnd]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
//            VStack {
//                BackgroundAnimation()
//                    .drawingGroup()
//                    .edgesIgnoringSafeArea(.top)
//                    .frame(height: 350)
//                Spacer()
//            }
            
            ZStack {
                VStack {
                    Header(isAnimation: $isAnimation)
                        .frame(height: getRect().height / 6)
                        .padding(.top, 30)
                    Spacer()
                }
                
                Group {
                    RectangleReverseAngle(startY: 125).fill(Color.white)
                        .edgesIgnoringSafeArea([.horizontal, .bottom])
                    
                    
                    
                    ScrollView {
                        LazyVStack {
                            ForEach(scoreData) { item in
                                    OneCardScore(name: item.theme, result: item.score, date: item.date)
                                        .offset(y: isAnimation ? 0 : getRect().height)
                                        .animation(isAnimation ? .ripple(index: item.id).delay(1) : .none)
                            }
                        }
                    }
                    .frame(height: getRect().height * 4 / 6)
                    .offset(y: 120)
                }
                .offset(x: isAnimation ? 0 : getRect().height)
                .animation(.easeInOut(duration: 1))
            }
        }
        .onAppear {
            isAnimation.toggle()
        }
    }
}

struct ScoreTable_Previews: PreviewProvider {
    static var previews: some View {
        ScoreTableViewMain()
    }
}
