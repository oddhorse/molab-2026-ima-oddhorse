//
//  MotionCollector.swift
//  phone throwing
//
//  Created by john on 10/8/26.
//


import CoreMotion
import UIKit

@Observable
class MotionCollector {
	private let motionManager = CMMotionManager()
	private let motionQueue = OperationQueue()
	
	var pitch: Double = 0
	var roll: Double = 0
	var zAcceleration: Double = 0
	
	var frames: [MotionFrame] = []
	
	var onUpdate: (() -> Void) = {}
	
	private var currentOrientation: UIDeviceOrientation = .landscapeLeft
	private var orientationObserver: NSObjectProtocol? = nil
	let notification = UIDevice.orientationDidChangeNotification
	
	func start() {
		frames = []
		
		if motionManager.isDeviceMotionAvailable {
			motionManager.deviceMotionUpdateInterval = 0
			motionManager.startDeviceMotionUpdates(to: motionQueue) { [weak self] data, error in
				guard let self, let data else { return }
				DispatchQueue.main.async {
					self.handle(data)
				}
			}
		} else {
			print("Motion data isn't available on this device.")
		}
		
		UIDevice.current.beginGeneratingDeviceOrientationNotifications()
		
		orientationObserver = NotificationCenter.default.addObserver(
			forName: notification, object: nil, queue: .main
		) { [weak self] _ in
			switch UIDevice.current.orientation {
			case .faceUp, .faceDown, .unknown:
				break
			default:
				self?.currentOrientation = UIDevice.current.orientation
			}
		}
	}
	
	private func handle(_ data: CMDeviceMotion) {
		(roll, pitch) = currentOrientation.adjustedRollAndPitch(data.attitude)
		zAcceleration = data.userAcceleration.z
		
		frames.append(MotionFrame(motion: data))
		
		onUpdate()
	}
	
	func stop() {
		motionManager.stopDeviceMotionUpdates()
		if let orientationObserver = orientationObserver {
			NotificationCenter.default.removeObserver(
				orientationObserver, name: notification, object: nil)
		}
		orientationObserver = nil
	}
	
	deinit {
		stop()
	}
}

extension MotionCollector {
	func started() -> MotionCollector {
		start()
		return self
	}
}

extension UIDeviceOrientation {
	func adjustedRollAndPitch(_ attitude: CMAttitude) -> (
		roll: Double, pitch: Double
	) {
		switch self {
		case .unknown, .faceUp, .faceDown:
			return (attitude.roll, -attitude.pitch)
		case .landscapeLeft:
			return (attitude.pitch, -attitude.roll)
		case .portrait:
			return (attitude.roll, attitude.pitch)
		case .portraitUpsideDown:
			return (-attitude.roll, -attitude.pitch)
		case .landscapeRight:
			return (-attitude.pitch, attitude.roll)
		@unknown default:
			return (attitude.roll, attitude.pitch)
		}
	}
}
