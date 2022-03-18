
import SwiftUI


enum 🔛Phase {
    
    case waiting
    case fadeIn
    case maxVolume
    case fadeOut
    case powerOff
    
    
    func beforeStart() -> Bool {
        self == .fadeOut || self == .powerOff
    }
    
    
    struct arrow: View {
        
        var body: some View {
            
            Image(systemName: "arrow.left")
                .padding()
                .font(.title.weight(.semibold))
        }
    }
}
