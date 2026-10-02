//
//  FlyView.swift
//  birds
//
//  Created by john on 10/1/26.
//

import SwiftUI

struct FlyView: View {
	@State var birdIndex = 0
	@Environment(AudioPlayer.self) var audioPlayer
	
	@State var showWisdom = false
	
	var body: some View {
		VStack {
			
			Image("bird-\(audioPlayer.currentBeat)")
				.imageScale(.small)
				.foregroundStyle(.tint)
				.scaleEffect(0.6)
				.scaledToFit()
				.onAppear {
					audioPlayer.play()
				}
				.sheet(isPresented: $showWisdom) {
					WisdomView()
						.presentationDetents([.fraction(0.2)])
				}
				.padding()
			/*
			 Button { showWisdom = true } label: {
			 Image(systemName: "sparkles")
			 .padding()
			 .background(.regularMaterial, in: Circle())
			 }
			 */
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.overlay(alignment: .bottomTrailing) {
			Button { showWisdom = true } label: {
				Image(systemName: "bird")
				//.padding()
					//.background(.regularMaterial, in: Circle())
			}
			.buttonStyle(.glass)
			.buttonBorderShape(.circle)
			.padding()
		}
		
		//.buttonStyle(.glassProminent)
	}
	
	func playPauseAction() {
		if audioPlayer.isPlaying {
			audioPlayer.stop()
		}
		else {
			audioPlayer.play()
		}
	}
}

// AudioPlayer must be established here to avoid crash in preview
#Preview {
	FlyView()
		.environment(AudioPlayer())
}
