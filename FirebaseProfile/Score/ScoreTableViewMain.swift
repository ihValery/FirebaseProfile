//
//  ScoreTableViewMain.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct ScoreTableViewMain: View {
    @State private var isAnimation = true
    @State private var newValue = ""
    @State private var pickerSelect = ""
    @ObservedObject var session: SessionFirebase
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blueStart, .blueEnd]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            ZStack {
                VStack {
                    Header(isAnimation: $isAnimation, session: session)
                        .frame(height: 60)
                        .padding(.top, 30)
                    Spacer()
                }
                
                Group {
                    RectangleReverseAngle(startY: 80).fill(Color.white)
                        .edgesIgnoringSafeArea([.horizontal, .bottom])

                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.scoreData, id: \.self) { item in
                                OneCardScore(name: item.theme, result: item.maxScore, date: item.date)
//                                    OneCardScore(name: item.theme, result: item.score, date: item.date)
//                                        .offset(y: isAnimation ? 0 : getRect().height)
//                                        .animation(.ripple(index: item.id).delay(1))
                            }
                        }
                    }
                    .frame(height: getRect().height * 3 / 5 - 40)
                    .offset(y: 20)
                }
                .offset(x: isAnimation ? 0 : getRect().height)
                .animation(.easeInOut(duration: 1))
            }
            
            VStack {
                Spacer()
                Picker("", selection: $pickerSelect) {
                    Text("🐶").tag("🐶")
                    Text("🐘").tag("🐘")
                    Text("🥑").tag("🥑")
                    Text("🏓").tag("🏓")
                    Text("🧑🏽‍🚒").tag("🧑🏽‍🚒")
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: pickerSelect == "" ? 1 : 0))
                
                AuthTextField(name: "Введи число", field: $newValue)
                HStack {
                    AuthButton(lable: "Add") {
                        guard let number = Int(newValue) else { return }
                        viewModel.add(theme: pickerSelect, number: number)
                    }
                    AuthButton(lable: "Sign Out") {
                        session.sighOut()
                    }
                }
            }
            .padding(.horizontal).padding(.bottom, -10)
        }
        
        .onAppear {
            session.listen()
//            isAnimation.toggle()
        }
        
        .fullScreenCover(isPresented: $session.isSignIn) {
            AuthenticationView(session: session)
        }
    }
}

struct ScoreTable_Previews: PreviewProvider {
    static var previews: some View {
        ScoreTableViewMain(session: SessionFirebase(), viewModel: ViewModel())
    }
}
