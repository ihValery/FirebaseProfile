//
//  Header.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct Header: View {
    @Binding var isAnimation: Bool
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Spacer()
                    Text("Анастасия")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .padding(.leading).padding()
                }
                .offset(y: isAnimation ? 0 : getRect().height)
                .animation(.spring(dampingFraction: 0.7).delay(1))

                Spacer()
            }
            .zIndex(1)
            
            Spacer()
            ZStack {
                HStack {
                    Spacer()
                    ImageWithURL("https://carss.cc/wp-content/uploads/2020/07/3551-5.jpg")
                        .clipShape(CustomCorners(corner: .bottomRight, radius: 35))
                        .frame(width: 120, height: 120)
                        .padding().padding(.trailing)
                        .offset(x: isAnimation ? 0 : -getRect().height)
                        .animation(.spring(dampingFraction: 0.8).delay(0.7))
                }
            }
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(isAnimation: .constant(true))
            .preferredColorScheme(.dark)
    }
}
