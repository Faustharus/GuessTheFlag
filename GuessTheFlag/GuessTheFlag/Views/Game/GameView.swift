//
//  GameView.swift
//  GuessTheFlag
//
//  Created by Damien Chailloleau on 04/11/2021.
//

import SwiftUI

enum alertCase {
    case inGame, endGame
}

struct GameView: View {
    @EnvironmentObject var historicBoard: HistoricBoard
    
    @State private var countries = ["Algeria", "Andorra", "Argentina", "Australia", "Austria", "Belgium", "Brazil", "Cameroon", "Canada", "Chile", "China", "Colombia", "CostaRica", "Cuba", "Denmark", "Egypt", "France", "FrenchPolynesia", "Germany", "India", "Ireland", "Italy", "Jamaica", "Japan", "Kenya", "Luxembourg", "Mexico", "Monaco", "Morocco", "NewZealand", "Nigeria", "Peru", "Russia", "SouthAfrica", "SouthKorea", "Spain", "Switzerland", "Taiwan", "Tunisia", "UAE", "UnitedKingdom", "UnitedStates", "Uruguay"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var currentScore: Int = 0
    @State private var titleAlert: String = ""
    @State private var messageAlert: String = ""
    @State private var showingAlert: Bool = false
    
    @State private var countingQuestion: Int = 7
    @State private var activeAlert: alertCase = .inGame
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3), .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)], center: .top, startRadius: 200, endRadius: 700).edgesIgnoringSafeArea(.top)
            VStack {
                
                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Find the Flag of:")
                            .foregroundStyle(.secondary)
                        Text("\(countries[correctAnswer])")
                            .font(.title.bold())
                    }
                    
                    VStack(spacing: 15) {
                        ForEach(0..<3) { item in
                            Button {
                                nextQuestion(item)
                            } label : {
                                FlagImage(image: "\(countries[item])")
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 500)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .cornerRadius(25.0)
                
                Spacer()
                Spacer()
                
                Text("Your score is \(currentScore)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
            .alert(isPresented: $showingAlert) {
                switch activeAlert {
                case .inGame:
                    return Alert(title: Text(titleAlert), message: Text(messageAlert), dismissButton: .default(Text("Continue"), action: { newQuestion(); countingQuestion -= 1 } ))
                case .endGame:
                    return Alert(title: Text(titleAlert), message: Text(messageAlert), dismissButton: .default(Text("Restart"), action: { saveGame(); newGame() } ))
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GameView()
                .environmentObject(HistoricBoard())
        }
    }
}


// MARK: - Functions
extension GameView {
    
    func nextQuestion(_ number: Int) {
        if countingQuestion > 0 {
            if number == correctAnswer {
                titleAlert = "Good Answer !"
                messageAlert = "You earn 1 point"
                currentScore += 1
                self.activeAlert = .inGame
            } else {
                titleAlert = "Wrong Anwser"
                messageAlert = "It was the flag of \(countries[number])"
                self.activeAlert = .inGame
            }
        } else {
            if number == correctAnswer {
                currentScore += 1
                titleAlert = "End Game"
                messageAlert = "Final Score is \(currentScore) / 8"
                self.activeAlert = .endGame
            } else {
                titleAlert = "End Game"
                messageAlert = "Final Score is \(currentScore) / 8"
                self.activeAlert = .endGame
            }
        }
        showingAlert = true
    }
    
    func newQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func newGame() {
        currentScore = 0
        countingQuestion = 7
        newQuestion()
    }
    
    func saveGame() {
        historicBoard.addScores(scores: currentScore)
    }
    
}
