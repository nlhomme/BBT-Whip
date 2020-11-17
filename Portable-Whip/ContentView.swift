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
                Button(action: {
                    print("show setting view")
                }){
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 24, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing)
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

