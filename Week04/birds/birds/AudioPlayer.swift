//
//  AudioPlayer.swift
//  birds
//
// this is hardcoded with gymnopedie no. 1 to loop perfectly
//  Created by john on 10/1/26.
//

import AVFoundation

@Observable
class AudioPlayer {
	var player: AVAudioPlayer? = nil
	var timer: Timer?
	var isPlaying: Bool { player?.isPlaying ?? false }
	var currentBeat = 1
	var currentMeasure: Int {((currentBeat - 1) / 3) + 1}
	let timeStep: TimeInterval = 1 // seconds, equal to one measure in the song file
	let fullDuration: TimeInterval = 237 // seconds
	
	  
	// class must have initializer
	init() {
		print("AudioPlayer init")
		player = loadBundleAudio("gymnopedie-no1-quantized-60bpm-40kbps.mp3")
	}
	
	func play() {
		
		print("AudioPlayer playing", player as Any)
		// Loop indefinitely
		player?.numberOfLoops = 0
		player?.play()
		
		timer = Timer.scheduledTimer(withTimeInterval: timeStep, repeats: true, block: onEachBeat)
	}
	
	func stop() {
		player?.stop()
		timer?.invalidate()
		currentBeat = 1
	}
	
	func onEachBeat(_: Timer) {
		if currentBeat == 237 {
			player?.currentTime = 0
			currentBeat = 1
			
		} else {
			currentBeat += 1
		}
	}
	
	func loadBundleAudio(_ fileName:String) -> AVAudioPlayer? {
		let path = Bundle.main.path(forResource: fileName, ofType:nil)!
		let url = URL(fileURLWithPath: path)
		do {
			return try AVAudioPlayer(contentsOf: url)
		} catch {
			print("loadBundleAudio error", error)
		}
		return nil
	}
	
}
