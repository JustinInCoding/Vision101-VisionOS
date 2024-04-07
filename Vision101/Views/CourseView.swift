//
//  CourseView.swift
//  Vision101
//
//  Created by Justin on 2024/4/7.
//

import SwiftUI

struct CourseView: View {
	
	let course: Course
	
	var body: some View {
		VStack {
			Text(course.name)
				.font(.largeTitle)
			Text(course.content)
			Spacer()
		}.navigationTitle(course.name)
	}
}

#Preview {
	CourseView(course: Course(name: "visionOS", content: "Content goes here"))
}
