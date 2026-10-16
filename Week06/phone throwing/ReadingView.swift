//
//  ReadingView.swift
//  phone throwing
//
//  Created by john on 10/8/26.
//

import SwiftUI

struct ReadingView: View {
	let frames: [MotionFrame]
	var onRestart: () -> Void

	private var duration: TimeInterval {
		guard let first = frames.first?.timestamp,
			let last = frames.last?.timestamp
		else { return 0 }
		return last - first
	}

	var body: some View {
		VStack(spacing: 16) {
			Text("throw complete!!")
			Text("\(frames.count) samples recorded")
			Text("Duration: \(duration, specifier: "%.2f")s")

			Button("throw again") {
				onRestart()
			}
			.padding()
			
		}
		DataGraphs(frames: frames)
		.padding()
	}
}

#Preview {
	ReadingView(frames: [], onRestart: {})
}
