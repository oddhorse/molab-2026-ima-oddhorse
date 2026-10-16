//
//  SensorFrame.swift
//  phone throwing
//
//  Created by john on 10/8/26.
//

import CoreMotion

struct MotionFrame {
	let timestamp: TimeInterval
	let quaternion: (x: Double, y: Double, z: Double, w: Double)
	let rotationRate: (x: Double, y: Double, z: Double)
	let userAcceleration: (x: Double, y: Double, z: Double)
	let gravity: (x: Double, y: Double, z: Double)
	var rawAcceleration: (x: Double, y: Double, z: Double) {
		(0, 0, 0)
	}

	init(motion: CMDeviceMotion) {
		timestamp = motion.timestamp
		let q = motion.attitude.quaternion
		quaternion = (q.x, q.y, q.z, q.w)
		rotationRate = (motion.rotationRate.x, motion.rotationRate.y, motion.rotationRate.z)
		userAcceleration = (motion.userAcceleration.x, motion.userAcceleration.y, motion.userAcceleration.z)
		gravity = (motion.gravity.x, motion.gravity.y, motion.gravity.z)
	}

	init(
		timestamp: TimeInterval,
		quaternion: (x: Double, y: Double, z: Double, w: Double),
		rotationRate: (x: Double, y: Double, z: Double),
		userAcceleration: (x: Double, y: Double, z: Double),
		gravity: (x: Double, y: Double, z: Double)
	) {
		self.timestamp = timestamp
		self.quaternion = quaternion
		self.rotationRate = rotationRate
		self.userAcceleration = userAcceleration
		self.gravity = gravity
	}
}

extension MotionFrame {
	static let placeholderFrames: [MotionFrame] = [
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
		),
		MotionFrame(
			timestamp: 2,
			quaternion: (x: 0.02, y: 0.01, z: 0, w: 0.9997),
			rotationRate: (x: 0.6, y: 0.1, z: 0.25),
			userAcceleration: (x: 0.1, y: 0.3, z: -0.15),
			gravity: (x: 0, y: 0, z: -1)
		),
		MotionFrame(
			timestamp: 3,
			quaternion: (x: 0.03, y: 0.02, z: 0.01, w: 0.9993),
			rotationRate: (x: 0.4, y: 0.3, z: 0.1),
			userAcceleration: (x: 0.08, y: 0.25, z: -0.2),
			gravity: (x: 0, y: 0, z: -1)
		),
		MotionFrame(
			timestamp: 4,
			quaternion: (x: 0.04, y: 0.02, z: 0.01, w: 0.9988),
			rotationRate: (x: 0.2, y: 0.15, z: -0.05),
			userAcceleration: (x: 0.03, y: 0.15, z: -0.1),
			gravity: (x: 0, y: 0, z: -1)
		)
	]
}
