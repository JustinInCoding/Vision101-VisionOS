//
//  Course.swift
//  Vision101
//
//  Created by Justin on 2024/4/7.
//

import Foundation

struct Course: Identifiable, Hashable {
	let id = UUID()
	let name: String
	let content: String
}
