import SwiftUI

enum GameMode: String {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {

                Text("Color Matching Game")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                NavigationLink("Easy Mode") {
                    GameView(mode: .easy)
                }
                .buttonStyle(.borderedProminent)

                NavigationLink("Medium Mode") {
                    GameView(mode: .medium)
                }
                .buttonStyle(.borderedProminent)

                NavigationLink("Hard Mode") {
                    GameView(mode: .hard)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}
