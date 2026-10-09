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

	init(motion: CMDeviceMotion) {
		timestamp = motion.timestamp
		let q = motion.attitude.quaternion
		quaternion = (q.x, q.y, q.z, q.w)
		rotationRate = (motion.rotationRate.x, motion.rotationRate.y, motion.rotationRate.z)
		userAcceleration = (motion.userAcceleration.x, motion.userAcceleration.y, motion.userAcceleration.z)
		gravity = (motion.gravity.x, motion.gravity.y, motion.gravity.z)
	}
}
