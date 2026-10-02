//
//  birdsApp.swift
//  birds
//
//  Created by john on 10/1/26.
//

import SwiftUI

@main
struct birdsApp: App {
	@State var audioPlayer = AudioPlayer()
	var body: some Scene {
		WindowGroup {
			FlyView()
				.environment(audioPlayer)
		}
	}
}
