//
//  SkyView.swift
//  Vision101
//
//  Created by Justin on 2024/4/7.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct SkyView: View {
	var body: some View {
		RealityView { content in
			guard let resource = try? await TextureResource(named: "skyView") else {
				return
			}
			
			var material = UnlitMaterial()
			material.color = .init(texture: .init(resource))
			
			let entity = Entity()
			entity.components.set(ModelComponent(mesh: .generateSphere(radius: 1000), materials: [material]))
			entity.scale *= .init(x: -1, y: 1, z: 1)
			
			content.add(entity)
			
		}
	}
}

#Preview {
	SkyView()
}
