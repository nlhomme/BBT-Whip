//
//  InterfaceController.swift
//  BBT-Whip-Watch Extension
//
//  Created by Nicolas Lhomme on 16/11/2020.
//

import WatchKit
import Foundation

import AVFoundation
let path = Bundle.main.path(forResource: "whip-cracking.mp3", ofType: nil)!
let url = URL(fileURLWithPath: path)
var whipCrackingSoundEffect: AVAudioPlayer?

class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
    }

    var shaker:WatchShaker = WatchShaker(shakeSensibility: .shakeSensibilityNormal, delay: 0.2)

    override func willActivate() {

        super.willActivate()
        shaker.delegate = self
        shaker.start()
    }

    override func didDeactivate() {

        super.didDeactivate()
        shaker.stop()

    }

}

extension InterfaceController: WatchShakerDelegate
{
    func watchShaker(_ watchShaker: WatchShaker, didShakeWith sensibility: ShakeSensibility) {
        //print("YOU HAVE SHAKEN YOUR ⌚️⌚️⌚️")
        do {
            whipCrackingSoundEffect = try AVAudioPlayer(contentsOf: url)
            whipCrackingSoundEffect?.play()
        } catch {
            // couldn't load a file :(
        }
    }

    func watchShaker(_ watchShaker: WatchShaker, didFailWith error: Error) {
        print(error.localizedDescription)
    }
}
