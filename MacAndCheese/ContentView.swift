import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @State private var zipURL: URL?

    var body: some View {
        VStack(spacing: 20) {
            Text("Mac and Cheese")
                .font(.largeTitle)

            Button("Abrir ZIP") {
                let panel = NSOpenPanel()
                panel.allowedContentTypes = [.zip]

                if panel.runModal() == .OK {
                    zipURL = panel.url
                }
            }

            if let zipURL {
                Text(zipURL.lastPathComponent)
            }

            Button("Gerar CIA") {
                if let zipURL {
                    BuildManager().build(zip: zipURL)
                }
            }
        }
        .padding()
        .frame(width: 500, height: 300)
    }
}
