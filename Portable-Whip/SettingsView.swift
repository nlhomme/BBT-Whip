//
//  Settings.swift
//  Portable-Whip
//
//  Created by Nicolas Lhomme on 17/11/2020.
//

import SwiftUI

struct SettingsView: View {
    @State private var selectedDisplayMode: NavigationBarItem.TitleDisplayMode = .large
    @State private var navigationTitle: String = "Settings"
    @Environment(\.openURL) var openURL

    let versionNumber = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    
    var body: some View {
        VStack{
            List {
                Section(header: Text("Section"),
                    footer: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
                    content: {
                        Label("Sun", systemImage: "sun.max")
                        Label("Cloud", systemImage: "cloud")
                        Label("Rain", systemImage: "cloud.rain")
                    }
                )
                Section(//header: Text("Portable Whip"),
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
        SettingsView()
    }
}
