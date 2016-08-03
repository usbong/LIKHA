//
//  VoiceOverCoordinator.swift
//  UsbongKit
//
//  Created by Joe Amanse on 26/03/2016.
//  Copyright © 2016 Usbong Social Systems, Inc. All rights reserved.
//

import Foundation
import AVFoundation

/// Provides default implementations for `AVSpeechSynthesizerDelegate`.
public class VoiceOverCoordinator: NSObject {
    public weak var delegate: VoiceOverCoordinatorDelegate?
    public weak var playableTree: AutoPlayableTree?
    
    internal var lastSpeechUtterance: AVSpeechUtterance?
    
    public override init() {
        super.init()
    }
    
    public convenience init(delegate: VoiceOverCoordinatorDelegate, playableTree: AutoPlayableTree? = nil) {
        self.init()
        
        self.delegate = delegate
        self.playableTree = playableTree
    }
}

extension VoiceOverCoordinator: AVSpeechSynthesizerDelegate {
    public func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didFinishSpeechUtterance utterance: AVSpeechUtterance) {
        guard let tree = playableTree else { return }
        
        // If auto-play and is on last speech utterance
        if tree.autoPlay && lastSpeechUtterance == utterance {
            delegate?.voiceOverCoordinatorDidFinish(self)
        }
    }
}

extension VoiceOverCoordinator: AVAudioPlayerDelegate {
    public func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        guard let tree = playableTree else { return }
        
        // If auto-play and is on audio player finished successfully, and is voice over audio player
        if tree.voiceOverAudioPlayer == player && tree.autoPlay && flag {
            delegate?.voiceOverCoordinatorDidFinish(self)
        }
    }
}

public protocol VoiceOverCoordinatorDelegate: class {
    func voiceOverCoordinatorDidFinish(coordinator: VoiceOverCoordinator)
}

public extension VoiceOverCoordinatorDelegate where Self: AutoPlayableTree {
    func voiceOverCoordinatorDidFinish(coordinator: VoiceOverCoordinator) {
        transitionToNextNode()
    }
}
