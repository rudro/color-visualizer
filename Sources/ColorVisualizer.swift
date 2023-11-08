import ArgumentParser
import SwiftUI

struct ColorVisualizerBase: ParsableCommand {
    @Argument(help: "The hex value of the colour you want to visualize.")
    var hex: String
}

@main
struct ColorVisualizer: App {
    let color: Color

    init() {
        do {
            let command = try ColorVisualizerBase.parseAsRoot() as! ColorVisualizerBase
            // Using a small `Color` extension from `@MarcoEidinger`
            // https://blog.eidinger.info/from-hex-to-color-and-back-in-swiftui
            guard let color = Color(hex: command.hex) else {
                fatalError("😢 \(command.hex) is not a valid hex colour")
            }
            self.color = color
        } catch {
            ColorVisualizerBase.exit(withError: error)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ColorDisplay(color: color)
        }
    }
}

struct ColorDisplay: View {
    let color: Color

    var body: some View {
        ZStack {
            Rectangle()
                .fill(color.opacity(0.4).gradient)
            VStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(color)
                    .frame(width: 300, height: 300)
                    .shadow(color: .black.opacity(0.15), radius: 10)

                if let hexString = color.toHex() {
                    Text("#\(hexString)")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .fontDesign(.rounded)
                }
            }

        }
        .frame(width: 600, height: 600)
    }
}
