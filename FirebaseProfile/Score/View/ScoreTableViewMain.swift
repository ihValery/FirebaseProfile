//
//  ScoreTableViewMain.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct ScoreTableViewMain: View {
    @State private var isAnimation = true
    @State private var showForm = false
    @ObservedObject var session: SessionFirebase
    @ObservedObject var scoreListViewModel = ScoreListViewModel()
    
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
                .onLongPressGesture {
                    session.sighOut()
                }
                
                Group {
                    RectangleReverseAngle(startY: 80).fill(Color.white)
                        .edgesIgnoringSafeArea([.horizontal, .bottom])

                    ScrollView {
                        LazyVStack {
                            ForEach(scoreListViewModel.scoreViewModels) { item in
                                OneCardScore(scoreViewModel: item)
                            }
                        }
                    }
                    .frame(height: getRect().height * 3 / 4)
                    .offset(y: 115)
                }
                .offset(x: isAnimation ? 0 : getRect().height)
                .animation(.easeInOut(duration: 1))
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: { showForm.toggle() }) {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                            .accentColor(.white)
                            .padding()
                            .background(Circle().fill(LinearGradient(gradient: Gradient(colors: [.blueStart, .blueEnd]), startPoint: .topTrailing, endPoint: .bottomLeading)))
                    }
                }.padding(.horizontal)
            }
        }
        
        .sheet(isPresented: $showForm) {
            NewScoreForm(scoreListViewModel: ScoreListViewModel())
        }
        
        .fullScreenCover(isPresented: $session.isSignIn) {
            AuthenticationView(session: session)
        }
    }
}

struct ScoreTable_Previews: PreviewProvider {
    static var previews: some View {
        ScoreTableViewMain(session: SessionFirebase())
    }
}
