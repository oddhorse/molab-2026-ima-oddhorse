//
//  ChartView.swift
//  phone throwing
//
//  Created by john on 10/15/26.
//

import SwiftUI
import Charts

private let sampleFrames: [MotionFrame] = [
	MotionFrame(
		timestamp: 0,
		quaternion: (x: 0, y: 0, z: 0, w: 1),
		rotationRate: (x: 0.1, y: -0.2, z: 0.05),
		userAcceleration: (x: 0.02, y: 0.1, z: -0.05),
		gravity: (x: 0, y: 0, z: -1)
	),
	MotionFrame(
		timestamp: 1,
		quaternion: (x: 0.01, y: 0, z: 0, w: 0.9999),
		rotationRate: (x: 0.3, y: -0.1, z: 0.15),
		userAcceleration: (x: 0.05, y: 0.2, z: -0.1),
		gravity: (x: 0, y: 0, z: -1)
	)
]

private struct AxisDataSample: Identifiable {
	let id = UUID()
	let axis: String
	let timestamp: TimeInterval
	let value: Double
}





struct DataGraphs: View {
	let frames: [MotionFrame]
	var firstTimestamp: TimeInterval { frames.first?.timestamp ?? 0 }
	var lastTimestamp: TimeInterval { frames.last?.timestamp ?? 1 }
	
	var padAmt: Double {
		(lastTimestamp - firstTimestamp) * 0.05
	}
	
	private var rotationRateSamples: [AxisDataSample] {
		frames.flatMap { frame in
			[
				AxisDataSample(axis: "X", timestamp: frame.timestamp, value: frame.rotationRate.x),
				AxisDataSample(axis: "Y", timestamp: frame.timestamp, value: frame.rotationRate.y),
				AxisDataSample(axis: "Z", timestamp: frame.timestamp, value: frame.rotationRate.z)
			]
		}
	}
	private var quaternionSamples: [AxisDataSample] {
		frames.flatMap { frame in
			[
				AxisDataSample(axis: "X", timestamp: frame.timestamp, value: frame.quaternion.x),
				AxisDataSample(axis: "Y", timestamp: frame.timestamp, value: frame.quaternion.y),
				AxisDataSample(axis: "Z", timestamp: frame.timestamp, value: frame.quaternion.z),
				AxisDataSample(axis: "W", timestamp: frame.timestamp, value: frame.quaternion.w)
			]
		}
	}
	private var userAccelerationSamples: [AxisDataSample] {
		frames.flatMap { frame in
			[
				AxisDataSample(axis: "X", timestamp: frame.timestamp, value: frame.userAcceleration.x),
				AxisDataSample(axis: "Y", timestamp: frame.timestamp, value: frame.userAcceleration.y),
				AxisDataSample(axis: "Z", timestamp: frame.timestamp, value: frame.userAcceleration.z)
			]
		}
	}
	private var gravitySamples: [AxisDataSample] {
		frames.flatMap { frame in
			[
				AxisDataSample(axis: "X", timestamp: frame.timestamp, value: frame.gravity.x),
				AxisDataSample(axis: "Y", timestamp: frame.timestamp, value: frame.gravity.y),
				AxisDataSample(axis: "Z", timestamp: frame.timestamp, value: frame.gravity.z)
			]
		}
	}
	var body: some View {
		Text("rotation rate")
		VStack {
			Chart(rotationRateSamples) { sample in
				LineMark(
					x: .value("time", sample.timestamp),
					y: .value("rotation rate", sample.value)
				)
				.foregroundStyle(by: .value("axis", sample.axis))
				.symbol(by: .value("axis", sample.axis))
			}
			.chartXScale(domain: (firstTimestamp - padAmt)...(lastTimestamp + padAmt))
			//.frame(height: 200)
			Text("quaternion")
			Chart(quaternionSamples) { sample in
				LineMark(
					x: .value("time", sample.timestamp),
					y: .value("quaternion", sample.value)
				)
				.foregroundStyle(by: .value("axis", sample.axis))
				.symbol(by: .value("axis", sample.axis))
			}
			.chartXScale(domain: (firstTimestamp - padAmt)...(lastTimestamp + padAmt))
			//.frame(height: 200)
			Text("user acceleration")
			Chart(userAccelerationSamples) { sample in
				LineMark(
					x: .value("time", sample.timestamp),
					y: .value("user acceleration", sample.value)
				)
				.foregroundStyle(by: .value("axis", sample.axis))
				.symbol(by: .value("axis", sample.axis))
			}
			.chartXScale(domain: (firstTimestamp - padAmt)...(lastTimestamp + padAmt))
			//.frame(height: 200)
			Text("gravity")
			Chart(gravitySamples) { sample in
				LineMark(
					x: .value("time", sample.timestamp),
					y: .value("gravity", sample.value)
				)
				.foregroundStyle(by: .value("axis", sample.axis))
				.symbol(by: .value("axis", sample.axis))
			}
			.chartXScale(domain: (firstTimestamp - padAmt)...(lastTimestamp + padAmt))
			//.frame(height: 200)
		}
	}
	
}

#Preview {
	DataGraphs(frames: MotionFrame.placeholderFrames)
}
