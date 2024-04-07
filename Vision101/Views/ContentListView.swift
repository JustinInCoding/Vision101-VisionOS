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
		
	@State private var selectedCourse: Course? = nil
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
		TabView {
			NavigationSplitView {
				List(courses, selection: $selectedCourse) { course in
					NavigationLink(course.name, value: course)
				}
			} detail: {
				if let selectedCourse = selectedCourse {
					CourseView(course: selectedCourse)
				} else {
					Text("Select a course from the list to see its details.")
				}
			}
			.font(.largeTitle)
			.tabItem {
				Image(systemName: "window.awning.closed")
				Text("Window")
			}
			NavigationSplitView {
				Text("Volumn Tab")
			} detail: {
				VolumeView()
			}
				.tabItem {
					Image(systemName: "cube")
					Text("Volumn")
				}
			Text("Immersive Tab")
				.font(.largeTitle)
				.foregroundColor(.orange)
				.tabItem {
					Image(systemName: "globe")
					Text("Immersive")
				}
		}
	}
}

#Preview(windowStyle: .automatic) {
	ContentListView()
}
