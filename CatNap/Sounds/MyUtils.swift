

import Foundation
import CoreGraphics
import AVFoundation


//play music
var backgroundMusicPlayer: AVAudioPlayer!

func playBackgroundMusic(filename: String) {
    let resourceUrl = Bundle.main.urlForResource(filename, withExtension: nil)
    
    guard let url = resourceUrl else {
        print("Could not find file: \(filename)")
        return
    }
    
    do {
        try backgroundMusicPlayer = AVAudioPlayer(contentsOf: url)
        backgroundMusicPlayer.numberOfLoops = -1
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.play()
    } catch {
        print("Could not create audio player!")
        return
    }
}

// adding
func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func += ( left: inout CGPoint, right: CGPoint) {
    left = left + right
}

func + (left: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: left.x + scalar, y: left.y + scalar)
}

func += ( left: inout CGPoint, scalar: CGFloat) {
    left = left + scalar
}

///

// subtracting
func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func -= ( left: inout CGPoint, right: CGPoint) {
    left = left - right
}

func - (left: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: left.x - scalar, y: left.y - scalar)
}

func -= ( left: inout CGPoint, scalar: CGFloat) {
    left = left - scalar
}

// multiplication
func * (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x * right.x, y: left.y * right.y)
}

func *= ( left: inout CGPoint, right: CGPoint) {
    left = left * right
}

func * (left: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: left.x * scalar, y: left.y * scalar)
}

func *= ( left: inout CGPoint, scalar: CGFloat) {
    left = left * scalar
}

// division
func / (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x / right.x, y: left.y / right.y)
}

func /= ( left: inout CGPoint, right: CGPoint) {
    left = left / right
}

func / (left: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: left.x / scalar, y: left.y / scalar)
}

func /= ( left: inout CGPoint, scalar: CGFloat) {
    left = left / scalar
}

#if !(arch(x86_64) || arch(arm64))
func atam2(y: CGFloat, x: CGFloat) -> CGFloat {
    return CGFloat(atan2f(Float(y), Float(x)))
}

func sqrt(a: CGFloat) -> CGFloat {
    return CGFloat(sqrtf(Float(a)))
}
#endif

extension CGPoint {
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    
    func normalized() -> CGPoint {
        return self / length()
    }
    
    var angle: CGFloat {
        return atan2(y, x)
    }
}

let π = CGFloat(M_PI)

func shortestAngleBetween(angle1: CGFloat, angle2: CGFloat) -> CGFloat {
    let twoπ: CGFloat  = π * 2
    var angle = (angle2 - angle1) / twoπ
    
    if angle >= π {
        angle -= twoπ
    }
    
    if angle <= -π {
        angle += twoπ
    }
    
    return angle
}

extension CGFloat {
    func sign() -> CGFloat {
        return self >= 0.0 ? 1.0 : -1.0
    }
    
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UInt32.max))
    }
    
    static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        assert(min < max)
        return CGFloat.random() * (max-min) + min
    }
}


