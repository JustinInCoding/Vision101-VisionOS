//
//  ContentView.swift
//  Vision101
//
//  Created by Justin on 2024/4/7.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct ContentListView: View {
	
	@State private var isShowingImmersive = false
	@State private var selectedCourse: Course? = nil
	
	@Environment(\.openImmersiveSpace) var openImmersiveScene
	@Environment(\.dismissImmersiveSpace) var dismissImmersiveScene
	
	private var courses = [
		Course(name: "Window App", content: """
												 A volume is used to add 3D content to your app. Ut necessitatibus voluptate praesentium id eos eaque itaque cumque. Sunt error et et. Dignissimos veritatis eum ad eius omnis. Pariatur eaque nihil fuga omnis quia. Aperiam corporis odit vero aspernatur in recusandae.Delectus quo sed dolores quo architecto et necessitatibus aut. Velit impedit animi est. Sapiente animi nostrum aperiam quod ut eos. Debitis dicta voluptatem est atque. Soluta iure ipsum iure sed. Natus ut in voluptas et voluptates id
												 """),
		Course(name: "Volume App", content: """
										 A volume is used to add 3D content to your app. Ut necessitatibus voluptate praesentium id eos eaque itaque cumque. Sunt error et et. Dignissimos veritatis eum ad eius omnis. Pariatur eaque nihil fuga omnis quia. Aperiam corporis odit vero aspernatur in recusandae.Delectus quo sed dolores quo architecto et necessitatibus aut. Velit impedit animi est. Sapiente animi nostrum aperiam quod ut eos. Debitis dicta voluptatem est atque. Soluta iure ipsum iure sed. Natus ut in voluptas et voluptates id
										 """),
		Course(name: "Immersive App", content: """
										An ImmersiveSpace takes over the view. Ut necessitatibus voluptate praesentium id eos eaque itaque cumque. Sunt error et et. Dignissimos veritatis eum ad eius omnis. Pariatur eaque nihil fuga omnis quia. Aperiam corporis odit vero aspernatur in recusandae.Delectus quo sed dolores quo architecto et necessitatibus aut. Velit impedit animi est. Sapiente animi nostrum aperiam quod ut eos. Debitis dicta voluptatem est atque. Soluta iure ipsum iure sed. Natus ut in voluptas et voluptates id
										"""),
		Course(name: "Ornaments", content: ""),
		Course(name: "App Icon", content: "")

	]
	
	var body: some View {
		VStack {
			TabView {
				NavigationSplitView {
					List(courses, selection: $selectedCourse) { course in
						NavigationLink(course.name, value: course)
					}.font(.largeTitle)
						.foregroundColor(.orange)
				} detail: {
					if let selectedCourse = selectedCourse {
						CourseView(course: selectedCourse)
					} else {
						Text("Select a course from the list to see its details.")
					}
				}
				.tabItem {
					Image(systemName: "window.awning.closed")
					Text("Window")
				}
				NavigationSplitView {
					Text("Volumn Tab")
						.font(.largeTitle)
						.foregroundColor(.orange)
				} detail: {
					VolumeView()
				}
				.tabItem {
					Image(systemName: "cube")
					Text("Volumn")
				}
				NavigationSplitView {
					Text("Immersive Tab")
						.font(.largeTitle)
						.foregroundColor(.orange)
				} detail: {
					Button("Open immersiveSpace") {
						Task {
							let result = await openImmersiveScene(id: "ImmersiveScene")
							if case .error = result {
								print("An error occured")
							}
							isShowingImmersive = true
						}
					}.foregroundColor(.blue)
					
				}
				.tabItem {
					Image(systemName: "globe")
					Text("Immersive")
				}
			}.opacity(isShowingImmersive ? 0 : 1)
			
			Button("Close immersiveSpace") {
				Task {
					await dismissImmersiveScene()
					print("Dismissing complete.")
					isShowingImmersive = false
				}
			}.foregroundColor(.red)
				.opacity(isShowingImmersive ? 1 : 0)
		}
	}
}

#Preview(windowStyle: .automatic) {
	ContentListView()
}
