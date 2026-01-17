import SwiftUI

enum GameMode: String {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

<<<<<<< HEAD

=======
>>>>>>> 7986e471e789437fbae23e628ce64e8a5d3f02a1
struct ContentView: View {

    @State private var playerName = ""

    var body: some View {
        NavigationStack {
<<<<<<< HEAD
            ZStack {

                // Background gradient
                LinearGradient(
                    colors: [Color(.systemBackground), Color(.secondarySystemBackground)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 30) {

                    Spacer()

                    // Game Title
                    Text("COLOR MATCH")
                        .font(.system(size: 42, weight: .bold))
                        .foregroundStyle(.primary)

                    Text("Tap the correct color")
                        .foregroundStyle(.secondary)

                    // Nickname input
                    TextField("Nickname (max 8)", text: $playerName)
                        .padding()
                        .frame(width: 240)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .strokeBorder(Color.secondary.opacity(0.2), lineWidth: 1)
                        )
                        .tint(.accentColor)
                        .onChange(of: playerName) { oldValue, newValue in
                            if newValue.count > 8 {
                                playerName = String(newValue.prefix(8))
                            }
                        }

                    // Buttons
                    VStack(spacing: 16) {

                        NavigationLink {
                            GameView(mode: .easy, playerName: playerName)
                        } label: {
                            menuButton(text: "Easy Difficulty")
                        }

                        NavigationLink {
                            GameView(mode: .medium, playerName: playerName)
                        } label: {
                            menuButton(text: "Medium Difficulty")
                        }

                        NavigationLink {
                            GameView(mode: .hard, playerName: playerName)
                        } label: {
                            menuButton(text: "Hard Difficulty")
                        }
                    }
                    .disabled(playerName.isEmpty)

                    Spacer()

                    // Footer
                    Text("© Malith Kumaranayaka All right reserved.")
                        .foregroundStyle(.tertiary)
                        .font(.footnote)
                }
                .padding()
            }
=======
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
>>>>>>> 7986e471e789437fbae23e628ce64e8a5d3f02a1
        }
    }
}

<<<<<<< HEAD
// Reusable menu button
struct menuButton: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 260, height: 55)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.accentColor)
            )
            .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}

=======
>>>>>>> 7986e471e789437fbae23e628ce64e8a5d3f02a1
