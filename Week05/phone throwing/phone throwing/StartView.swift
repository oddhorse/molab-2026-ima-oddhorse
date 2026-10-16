//
//  StartView.swift
//  phone throwing
//
//  Created by john on 10/8/26.
//

import SwiftUI

struct StartView: View {
	@Environment(MotionCollector.self) var motionCollector: MotionCollector
	var onStart: () -> Void

	var body: some View {
		VStack {
			Image(systemName: "figure.american.football")
				.imageScale(.large)
				.symbolEffect(.pulse)
				//.foregroundStyle(.tint)
				.padding(4)
			Text("the great worldwide phone throwing competition")
				.frame(width: 260)

			Button("throw") {
				motionCollector.start()
				motionCollector.startCollection()
				onStart()
			}
			.padding()
		}
		.padding()
	}
}

#Preview {
	StartView(onStart: {})
		.environment(MotionCollector())
}
