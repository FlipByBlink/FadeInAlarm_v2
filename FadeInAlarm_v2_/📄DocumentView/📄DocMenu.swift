
import SwiftUI

struct ðDocumentMenu: View {
    var body: some View {
        List {
            Section {
                let ð = "https://apps.apple.com/app/id1465336070"
                Link(destination: URL(string: ð)!) {
                    HStack {
                        Label("Open AppStore page", systemImage: "link")
                        
                        Spacer()
                        
                        Image(systemName: "arrow.up.forward.app")
                    }
                }
                .font(.subheadline)
                
                Text("""
                    Alarm clock with taking a long time from small volume to max volume.
                    ä»»æã®æå»ã«ãªãã¨ãã£ããã¨å°ããã¤é³éãå¤§ãããªãã¢ã©ã¼ã ã¢ããªã
                    
                    [ OPTIONS ãªãã·ã§ã³ ]
                    Hour fade-in ãã§ã¼ãã¤ã³æé
                    ã»0:10
                    ã»0:30
                    ã»1:00
                    ã»5:00
                    ã»30:00
                    ã»1:00:00
                    
                    Hour fade-out ãã§ã¼ãã¢ã¦ãæé
                    ã»0:03
                    ã»0:07
                    ã»0:15
                    ã»0:30
                    ã»1:00
                    
                    Volume on waiting å¾æ©ä¸­ã®é³é
                    ã»10%
                    ã»5%
                    ã»3%
                    ã»1%
                    ã»0%
                    
                    [ REQUIRED å¿è¦ ]
                    Import your favorite audio file such as mp3.
                    é³å£°ãã¡ã¤ã«(mp3ãªã©)ãã¤ã³ãã¼ããã¦ãã ããã
                    
                    [ NOTICE æ³¨æ ]
                    App must be launched beforehand in advance.
                    äºåã«ã¢ããªãèµ·åããã¦ããå¿è¦ãããã¾ãã
                    """)
                .font(.subheadline)
                .padding(8)
                
                Label("version 2.1", systemImage: "signpost.left")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            } header: {
                Text("About")
            }
            
            Section {
                Text("""
                    2022-02-25
                    (English)This application don't collect user infomation.
                    (Japanese)ãã®ã¢ããªèªèº«ã«ããã¦ãã¦ã¼ã¶ã¼ã®æå ±ãä¸ååéãã¾ããã
                    """)
                .font(.subheadline)
                .padding(8)
            } header: {
                Text("Privacy Policy")
            }
            
            NavigationLink {
                ðSourceCodeMenu()
            } label: {
                Label("Source code", systemImage: "doc")
            }
            .font(.subheadline)
        }
    }
}




struct ðDocumentMenu_Previews: PreviewProvider {
    static let ð± = ð±Model()
    static var previews: some View {
        VStack {
            ðDocumentMenu()
        }
        .environmentObject(ð±)
        .previewLayout(.fixed(width: 500, height: 600))
    }
}
