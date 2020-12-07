//
//  ContentView.swift
//  BBT-Whip
//
//  Created by Nicolas Lhomme on 06/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            WhipView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Whip")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "info")
                    Text("About")
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

