//
//  WhipView.swift
//  Portable-Whip
//
//  Created by Nicolas LHOMME on 07/12/2020.
//

import SwiftUI
import AVFoundation
import Shiny

let path = Bundle.main.path(forResource: "whip-cracking.mp3", ofType: nil)!
let url = URL(fileURLWithPath: path)

var whipCrackingSoundEffect: AVAudioPlayer?

struct WhipView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView(){
            ZStack {
                ShakableViewRepresentable()
                    .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)

                VStack{
                    Spacer()
                    
                    Image("Whip")
                        .resizable()
                        .scaledToFit()
                        .frame(alignment: .center)
                        .padding()

                    Spacer()
                    
                    Text("Shake to whip")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).shiny()
                        .background(
                            RoundedRectangle(cornerRadius: 14.0)
                                .frame(width: 250.0, height: 70.0)
                                .shiny(.hyperGlossy(colorScheme == .dark ? .black : .white, intensity: CGFloat(0.0)))
                        )
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

    
struct WhipView_Previews: PreviewProvider {
    static var previews: some View {
        WhipView()
    }
}
