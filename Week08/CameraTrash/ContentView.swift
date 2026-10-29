//

import SwiftUI
import AVFoundation
import Photos

struct ContentView: View {
  @State var model = Model()
  @State var isRecording = false
      
  var body: some View {
    ZStack {
      FrameView(image: model.previewImage)
      VStack {
        Spacer()
        ScaleControlsView()
        RecordButtonView()
      }
    }
    .onAppear {
      model.checkPermissions()
      model.setupSession()
    }
    .alert("Video saved", isPresented: $model.showingSavedAlert) {
    }
    .onChange(of: model.videoSaved) { _, saved in
      if saved {
        model.showingSavedAlert = true
        model.videoSaved = false
      }
    }
  }
  
  // Downscale slider + algorithm picker
  func ScaleControlsView() -> some View {
    VStack(spacing: 6) {
      Text("Scale \(Int(model.scale * 100))%")
        .font(.caption)
        .foregroundColor(.white)
      Slider(value: $model.scaleControlValue, in: 0.05...1.0)
      Picker("Scaler", selection: Binding(get: { model.scaler },
                                          set: { model.changeScaler(to: $0) })) {
        ForEach(VideoScaler.allCases, id: \.self) { Text($0.rawValue) }
      }
      .pickerStyle(.segmented)
    }
    .padding(.horizontal, 30)
  }

  func RecordButtonView() -> some View {
    return Button(action: {
      if isRecording {
        model.stopRecording()
      } else {
        model.startRecording()
      }
      isRecording.toggle()
    }) {
      Circle()
        .fill(isRecording ? Color.red : Color.white)
        .frame(width: 70, height: 70)
        .padding()
        .overlay(
          Circle()
            .stroke(Color.black, lineWidth: 2)
            .frame(width: 80, height: 80)
        )
    }
    .padding(.bottom, 5)
  }

}


#Preview {
  ContentView()
}
