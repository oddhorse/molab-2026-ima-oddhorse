//
//  phonethrowingApp.swift
//  phone throwing
//
//  Created by john on 10/8/26.
//

import SwiftUI

enum Screen {
	case start
	case intake
	case reading
}

@main
struct phonethrowingApp: App {
	@State private var motionCollector = MotionCollector()
	@State private var screen: Screen = .start

    var body: some Scene {
        WindowGroup {
			Group {
				switch screen {
				case .start:
					StartView(onStart: {
						screen = .intake
					})
				case .intake:
					IntakeView(onStop: {
						screen = .reading
					})
				case .reading:
					ReadingView(frames: motionCollector.frames, onRestart: {
						screen = .start
					})
				}
			}
			.environment(motionCollector)
        }
    }
}
