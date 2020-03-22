

import UIKit
import AVFoundation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var player : AVAudioPlayer?
    var timer : Timer?

    func sceneDidBecomeActive(_ scene: UIScene) {
        let session = AVAudioSession.sharedInstance()
        try? session.setCategory(.playback)
        try? session.setActive(true, options: [])
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true,
                                         block: {_ in print("tick tock")})
        }
        if player == nil {
            player = try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "test", withExtension: "aif")!)
            player?.numberOfLoops = -1
            player?.play()
        }
    }

}

