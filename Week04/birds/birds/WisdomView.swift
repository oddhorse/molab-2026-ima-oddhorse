//
//  WisdomView.swift
//  birds
//
//  Created by john on 10/1/26.
//

import SwiftUI

struct WisdomView: View {
	@State var wiseText = "*flaps wings*"
	
	let textOpts = ["poo-tee-weet?", "*flaps wings*", "...it's late... no worms out...", "cawww", "what will i do? i don't want to be pushed from the nest...", "tired of this damn piano", "losing my feathers... can't lose my feathers..."]
	
	var body: some View {
		Text(wiseText)
			.onAppear {
				let rand = Int.random(in: textOpts.indices)
				wiseText = textOpts[rand]
			}
		
	}
}

#Preview {
	FlyView()
		.environment(AudioPlayer())
		.sheet(isPresented: .constant(true)) {
			WisdomView()
				.presentationDetents([.fraction(0.2)])
		}
}
