
import SwiftUI


struct 📁ImportFile: View {
    @AppStorage("💽Name") var 💽Name = "preset.mp3" //urlを検討？
    
    @State private var 📂 = false
    
    let 🗄 = FileManager.default
    
    var 🗃: URL {
        🗄.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    var body: some View {
        Button {
            📂.toggle()
        } label: {
            Image(systemName: "folder.badge.plus")
                .symbolRenderingMode(.multicolor)
                .font(.largeTitle)
        }
        .font(.title2)
        .accessibilityLabel("Import file")
        .fileImporter(isPresented: $📂, allowedContentTypes: [.audio]) { 🅁esult in
            do {
                let 📦 = try 🅁esult.get()
                
                do {
                    let 🗂 = try 🗄.contentsOfDirectory(at: 🗃, includingPropertiesForKeys: nil)
                    if let 📍 = 🗂.first {
                        do { try 🗄.removeItem(at: 📍) } catch { print("👿", error) }
                    }
                } catch { print(error) }
                
                let 🄽ewURL = 🗃.appendingPathComponent(📦.lastPathComponent)
                
                if 📦.startAccessingSecurityScopedResource() {
                    do {
                        try 🗄.copyItem(at: 📦, to: 🄽ewURL)
                        💽Name = 🄽ewURL.lastPathComponent
                    } catch { print("👿", error) }
                }
                📦.stopAccessingSecurityScopedResource()
            } catch { print("👿", error) }
        }
    }
}


struct 📁FileName: View {
    @AppStorage("💽Name") var 💽Name = "preset.mp3"
    
    var body: some View {
        Text(💽Name)
            .kerning(1.2)
            .foregroundStyle(.secondary)
            .font(.body.weight(.semibold))
    }
}


struct 📁FilePreview: View {
    @EnvironmentObject var 📱: 📱Model
    
    @AppStorage("💽Name") var 💽Name = "preset.mp3"
    
    var body: some View {
        Button {
            if 📱.📻.ⓟlayer.isPlaying {
                📱.📻.ⓟlayer.stop()
            } else {
                📱.📻.ⓟreview()
            }
        } label: {
            Image(systemName: "playpause")
                .font(.body.weight(.semibold))
                .foregroundColor(📱.📻.ⓟlayer.isPlaying ? .red : nil)
                .disabled(📱.🔛 != .PowerOff)
                .opacity(0.75)
                .onChange(of: 💽Name) { _ in
                    📱.📻.ⓟlayer.stop()
                }
        }
    }
}




struct 📁ImportFile_Previews: PreviewProvider {
    static let 📱 = 📱Model()
    
    static var previews: some View {
        VStack(spacing: 6) {
            📁ImportFile()
            
            📁FileName()
            
            📁FilePreview()
        }
        .previewLayout(.fixed(width: 200, height: 200))
        .environmentObject(📱)
    }
}
