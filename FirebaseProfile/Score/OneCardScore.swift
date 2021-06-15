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
    var date: Date
    
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    Text(name)
                        .font(.system(size: 60))
                    
                    VStack(alignment: .leading) {
                        Text("Результат  ")
                            .font(.title)
                        Text(dateToString(date))
                            .font(.subheadline).opacity(0.6)
                    }
                    .opacity(0.6)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text(String(result))
                        .font(.system(size: 50).bold())
                        .opacity(0.7)
                }
                .zIndex(1)
            }
        }
        .frame(maxWidth: .infinity)
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
        OneCardScore(name: "🧑🏽‍🚒", result: 35, date: Date(timeIntervalSince1970: 1623323920))
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
