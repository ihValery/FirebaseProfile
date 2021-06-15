//
//  ScrollViewScoreTable.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct OneCardScore: View {
    var name: String
    var result: Int
//    var date: Date
    
    var body: some View {
        ZStack {
            HStack {
                Text(name)
                    .font(.system(size: 60))
                    .offset(y: 7)
                Spacer()
            }
            
            HStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Результат  ")
                            .font(.title)
//                        Text(dateToString(date))
//                            .font(.subheadline).opacity(0.6)
                    }
                    .opacity(0.6)
                    
                    Text(String(result))
                        .font(.system(size: 50).bold())
                        .opacity(0.7)
                        .offset(y: -5)
                }
                .foregroundColor(.black)
            }
        }
        .padding(.horizontal, 40)
        .background(BgCardScore())
        .padding(.vertical, 35).padding(.leading, 10)
    }
    
    private func dateToString(_ date: Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        timeFormatter.dateStyle = .short
        return timeFormatter.string(from: date)
    }
}

struct ScrollViewScoreTable_Previews: PreviewProvider {
    static var previews: some View {
        OneCardScore(name: "🧑🏽‍🚒", result: 35)
    }
}

struct BgCardScore: View {
    var body: some View {
        VStack {
            Rectangle().fill(Color.cardScoreTwo).opacity(0.3)
                .cornerRadius(6)
                .clipShape(CustomCorners(corner: [.topLeft, .bottomRight], radius: 60))
                .frame(height: 120)
        }
        .padding()
    }
}
