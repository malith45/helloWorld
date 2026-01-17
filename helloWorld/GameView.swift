import SwiftUI

<<<<<<< HEAD
struct HighScore: Codable {
    let name: String
    let score: Int
}

struct GameView: View {

    let mode: GameMode
    let playerName: String
=======
struct GameView: View {

    let mode: GameMode
>>>>>>> 7986e471e789437fbae23e628ce64e8a5d3f02a1

    @State private var colors: [Color] = []
    @State private var targetIndex = 0
    @State private var score = 0
<<<<<<< HEAD
    @State private var highScores: [HighScore] = []

    // Grid size based on difficulty
=======

>>>>>>> 7986e471e789437fbae23e628ce64e8a5d3f02a1
    var gridSize: Int {
        if mode == .easy {
            return 3
        } else if mode == .medium {
            return 4
        } else {
            return 5
        }
    }

    var columns: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: gridSize)
    }

    var body: some View {
<<<<<<< HEAD
        ZStack {

            // Background
            LinearGradient(
                colors: [Color.black, Color.purple],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {

                // Title
                Text("\(mode.rawValue) Mode")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Player: \(playerName)")
                    .foregroundColor(.white.opacity(0.8))

                // Score
                Text("Score: \(score)")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(12)

                // Target Color
                if !colors.isEmpty {
                    VStack(spacing: 6) {
                        Text("Match this color")
                            .foregroundColor(.white.opacity(0.7))

                        RoundedRectangle(cornerRadius: 16)
                            .fill(colors[targetIndex])
                            .frame(width: 90, height: 90)
                            .shadow(radius: 5)
                    }
                }

                // Game Grid
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(0..<colors.count, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(colors[index])
                            .frame(height: 55)
                            .shadow(radius: 2)
                            .onTapGesture {
                                if index == targetIndex {
                                    score += 1
                                    saveHighScore()
                                    generateColors()
                                }
                            }
                    }
                }
                .padding()

                // High Scores
                VStack(alignment: .leading, spacing: 6) {
                    Text("🏆 Top 3 High Scores")
                        .font(.headline)
                        .foregroundColor(.white)

                    ForEach(highScores.indices, id: \.self) { i in
                        Text("\(i + 1). \(highScores[i].name) - \(highScores[i].score)")
                            .foregroundColor(.white.opacity(0.9))
                    }
                }
                .padding()
                .background(Color.white.opacity(0.15))
                .cornerRadius(16)

                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            loadHighScores()
=======
        VStack(spacing: 20) {

            Text("\(mode.rawValue) Mode")
                .font(.title)

            Text("Tap the matching color")
                .font(.headline)

            if !colors.isEmpty {
                Rectangle()
                    .fill(colors[targetIndex])
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
            }


            Text("Score: \(score)")
                .font(.title2)

            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<colors.count, id: \.self) { index in
                    Rectangle()
                        .fill(colors[index])
                        .frame(height: 60)
                        .onTapGesture {
                            if index == targetIndex {
                                score += 1
                                generateColors()
                            }
                        }
                }
            }
            .padding()

            Spacer()
        }
        .navigationTitle("Game")
        .onAppear {
>>>>>>> 7986e471e789437fbae23e628ce64e8a5d3f02a1
            generateColors()
        }
    }

<<<<<<< HEAD
    // MARK: - Game Logic

    func generateColors() {
        let possibleColors: [Color] = [.red, .blue, .green, .yellow, .orange, .purple]
        let total = gridSize * gridSize

        colors = (0..<total).map { _ in
            possibleColors.randomElement()!
        }

        targetIndex = Int.random(in: 0..<total)
    }

    func saveHighScore() {
        highScores.append(HighScore(name: playerName, score: score))
        highScores.sort { $0.score > $1.score }
        highScores = Array(highScores.prefix(3))

        if let data = try? JSONEncoder().encode(highScores) {
            UserDefaults.standard.set(data, forKey: "highScores")
        }
    }

    func loadHighScores() {
        if let data = UserDefaults.standard.data(forKey: "highScores"),
           let saved = try? JSONDecoder().decode([HighScore].self, from: data) {
            highScores = saved
        }
    }
}
=======
    func generateColors() {
        let possibleColors: [Color] = [.red, .blue, .green, .yellow, .orange, .purple]
        let totalSquares = gridSize * gridSize

        colors = (0..<totalSquares).map { _ in
            possibleColors.randomElement()!
        }

        targetIndex = Int.random(in: 0..<totalSquares)
    }
}

>>>>>>> 7986e471e789437fbae23e628ce64e8a5d3f02a1
