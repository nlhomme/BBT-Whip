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
                Section(header: Text("Section2"),
                    footer: Text("Pouet"),
                    content: {
                        Label("Sun", systemImage: "sun.max")
                        Label("Sun", systemImage: "sun.max")
                        Label("Version: 1.0", systemImage: "info.circle")
                    }
                )
            }.listStyle(InsetGroupedListStyle())
            
        }.navigationBarTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.large)
    }
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
