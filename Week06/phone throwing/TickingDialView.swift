//
//  TickingDial.swift
//  phone throwing
//
//  Created by john on 10/9/26.
//

import SwiftUI
public import Combine

struct TickingDialView: View {
	@State private var dialLevel = 0
	// Timer fires every 1.5 seconds
	let timer = Timer.publish(every: 0.75, on: .main, in: .common).autoconnect()

	var body: some View {
		Image(systemName: "gauge.with.dots.needle.\(gaugePercent)percent")
			.onReceive(timer) { _ in
				// Ttiggers automatically on every timer tick!
				withAnimation(.easeInOut) {
					dialLevel = (dialLevel + 1) % 4
				}
			}
	}

	private var gaugePercent: String {
		["0", "33", "67", "100"][dialLevel]
	}
}

#Preview {
	TickingDialView()
}
