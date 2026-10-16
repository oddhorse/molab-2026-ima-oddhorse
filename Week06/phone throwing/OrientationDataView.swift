//
//  OrientationDataView.swift
//  phone throwing
//
//  Created by john on 10/8/26.
//


import SwiftUI

struct OrientationDataView: View {
  @Environment(MotionCollector.self) var collector
	
	var lastFrame: MotionFrame? {
		collector.frames.last
	}

  var timestampString: String {
    String(lastFrame?.timestamp ?? 0)
  }

  var quaternionString: String {
    guard let q = lastFrame?.quaternion else { return "0, 0, 0, 0" }
    return "\(q.x), \(q.y), \(q.z), \(q.w)"
  }

  var rotationRateString: String {
    guard let r = lastFrame?.rotationRate else { return "0, 0, 0" }
    return "\(r.x), \(r.y), \(r.z)"
  }

  var userAccelerationString: String {
    guard let a = lastFrame?.userAcceleration else { return "0, 0, 0" }
    return "\(a.x), \(a.y), \(a.z)"
  }

  var gravityString: String {
    guard let g = lastFrame?.gravity else { return "0, 0, 0" }
    return "\(g.x), \(g.y), \(g.z)"
  }

  var body: some View {
	  if lastFrame != nil {
		  VStack {
			  Text("Timestamp: " + timestampString)
				  .font(.system(.body, design: .monospaced))
			  Text("Quaternion: " + quaternionString)
				  .font(.system(.body, design: .monospaced))
			  Text("Rotation Rate: " + rotationRateString)
				  .font(.system(.body, design: .monospaced))
			  Text("User Acceleration: " + userAccelerationString)
				  .font(.system(.body, design: .monospaced))
			  Text("Gravity: " + gravityString)
				  .font(.system(.body, design: .monospaced))
		  }
	  } else {
		  VStack {
			  Text("MotionCollector not initialized")
		  }
	  }
  }
}

#Preview {
  OrientationDataView()
    .environment(MotionCollector().started())
}
