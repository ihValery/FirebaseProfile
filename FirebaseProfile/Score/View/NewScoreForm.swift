//
//  NewScoreForm.swift
//  ScoreCards
//
//  Created by Валерий Игнатьев on 26.06.21.
//

import SwiftUI

struct NewScoreForm: View {
    @State private var newMaxScore = ""
    @State private var pickerSelect = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var scoreListViewModel: ScoreListViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Выбери тему")
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
                
                Text("Новый максимальный счет")
                TextField("Введи число", text: $newMaxScore)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            Button() {
                scoreListViewModel.add(theme: pickerSelect, number: newMaxScore)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Добавить новый счет")
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Capsule().fill(LinearGradient(gradient: Gradient(colors: [.blueStart, .blueEnd]), startPoint: .topTrailing, endPoint: .bottomLeading)))
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.top)
    }
}

struct NewScoreForm_Previews: PreviewProvider {
    static var previews: some View {
        NewScoreForm(scoreListViewModel: ScoreListViewModel())
    }
}
