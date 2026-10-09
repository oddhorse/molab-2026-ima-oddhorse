//
//  OrientationDataView.swift
//  phone throwing
//
//  Created by john on 10/8/26.
//


import SwiftUI

struct OrientationDataView: View {
  @Environment(MotionCollector.self) var collector

  var rollString: String {
    String(collector.roll)
  }

  var pitchString: String {
    String(collector.pitch)
  }

  var body: some View {
    VStack {
      Text("Horizontal: " + rollString)
        .font(.system(.body, design: .monospaced))
      Text("Vertical: " + pitchString)
        .font(.system(.body, design: .monospaced))
    }
  }
}

#Preview {
  OrientationDataView()
    .environment(MotionCollector().started())
}
