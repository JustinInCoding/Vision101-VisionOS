//
//  VolumnView.swift
//  Vision101
//
//  Created by Justin on 2024/4/7.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct VolumeView: View {
	
	@State var runAnimation = false
	
	var body: some View {
		VStack {
			
			Button("Start") {
				runAnimation.toggle()
			}
			
			RealityView { content in
				if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
					content.add(scene)
				}
			} update: { content in
				if let scene = content.entities.first {
					if runAnimation {
						scene.availableAnimations.forEach { animation in
							scene.playAnimation(animation.repeat(), transitionDuration: 3, startsPaused: false)
						}
						
					} else {
						scene.stopAllAnimations()
					}
				}
			}
		}
	}
}

#Preview {
	VolumeView()
}
