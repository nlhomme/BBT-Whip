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
        ZStack {
            ShakableViewRepresentable()
                .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
            
            VStack{
                Spacer()
                Image("Whip")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
        }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

