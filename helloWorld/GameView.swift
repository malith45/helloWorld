import SwiftUI

struct GameView: View {

    let mode: GameMode

    @State private var colors: [Color] = []
    @State private var targetIndex = 0
    @State private var score = 0

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
        VStack(spacing: 20) {

            Text("\(mode.rawValue) Mode")
                .font(.title)

            Text("Tap the matching color")
                .font(.headline)

            Rectangle()
                .fill(colors[targetIndex])
                .frame(width: 80, height: 80)
                .cornerRadius(10)

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
            generateColors()
        }
    }

    func generateColors() {
        let possibleColors: [Color] = [.red, .blue, .green, .yellow, .orange, .purple]
        let totalSquares = gridSize * gridSize

        colors = (0..<totalSquares).map { _ in
            possibleColors.randomElement()!
        }

        targetIndex = Int.random(in: 0..<totalSquares)
    }
}
