//
//  IntakeView.swift
//  phone throwing
//
//  Created by john on 10/8/26.
//

import SwiftUI

struct IntakeView: View {
	@Environment(MotionCollector.self) var motionCollector: MotionCollector
	var onStop: () -> Void

	var body: some View {
		VStack(spacing: 24) {
			Text("Recording…")
				.font(.headline)
			TickingDialView()
			OrientationDataView()

			Button("Stop") {
				motionCollector.stop()
				onStop()
			}
			.padding()
		}
		.padding()
	}
}

#Preview {
	IntakeView(onStop: {})
		.environment(MotionCollector().started())
}
