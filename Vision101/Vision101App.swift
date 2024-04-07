//
//  Vision101App.swift
//  Vision101
//
//  Created by Justin on 2024/4/7.
//

import SwiftUI

@main
struct Vision101App: App {
	
	@State private var currentStyle: ImmersionStyle = .full
	
	var body: some Scene {
		WindowGroup {
			//					VolumeView()
			ContentListView()
		}.windowStyle(.plain)
		
		ImmersiveSpace(id: "ImmersiveScene") {
			ImmersiveView()
		}.immersionStyle(selection: $currentStyle, in: .full)
	}
}
