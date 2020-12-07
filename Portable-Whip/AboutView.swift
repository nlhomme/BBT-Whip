//
//  AboutView.swift
//  Portable-Whip
//
//  Created by Nicolas Lhomme on 17/11/2020.
//

import SwiftUI

struct AboutView: View {
    @State private var selectedDisplayMode: NavigationBarItem.TitleDisplayMode = .large
    @State private var navigationTitle: String = "Settings"
    
    @Environment(\.openURL) var openURL
    
    let versionNumber = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    
    var body: some View {
        VStack{
            List {
                Section(//header: Text("Section"),
                    content: {
/* For later
                        Link(destination: URL(string: "https://itunes.apple.com/app/id\(appID)?action=write-review"), label: {
                                                    Label("Rate on the App Store", systemImage: "star")
                        })
*/
                        Link(destination: URL(string: "mailto:contact@nlhomme.fr")!, label: {
                            Label("Contact", systemImage: "envelope")
                        })
                        Link(destination: URL(string: "https://github.com/nlhomme/Portable-Whip")!, label: {
                            Label("See on GitHub", systemImage: "cloud")
                        })
                    }
                )
                Section(//header: Text("Version"),
                    content: {
                        Label("Version: \(versionNumber!)", systemImage: "info.circle")
                    }
                )
            }.listStyle(InsetGroupedListStyle())
            .buttonStyle(PlainButtonStyle())
            
        }.navigationBarTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.large)
    }
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
