//
//  ContentView.swift
//  BBT-Whip
//
//  Created by Nicolas Lhomme on 06/11/2020.
//

import SwiftUI
import AVFoundation

let path = Bundle.main.path(forResource: "whip-cracking.mp3", ofType: nil)!
let url = URL(fileURLWithPath: path)

var whipCrackingSoundEffect: AVAudioPlayer?

struct ContentView: View {
    var body: some View {
        NavigationView(){
            ZStack {
                ShakableViewRepresentable()
                    .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)

                VStack{
                    HStack{
                        Spacer()
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear").scaleEffect(1.4)
                        }.padding()
                    }
                
                    Spacer()
                
                    Image("Whip")
                        .resizable()
                        .scaledToFit()
                        .frame(alignment: .center)
                    Text("Shake to whip")
                        .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
            }.navigationBarTitle("Portable Whip")
            .navigationBarHidden(true)

            .onReceive(messagePublisher){ _ in
                do {
                    whipCrackingSoundEffect = try AVAudioPlayer(contentsOf: url)
            whipCrackingSoundEffect?.play()
                } catch {
                    // couldn't load a file :(
                }
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

