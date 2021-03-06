//
//  LandmrkSettings.swift
//  MacLandmarks
//
//  Created by 木下健一 on 2021/08/11.
//

import SwiftUI

struct LandmarkSettings: View {
    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .medium
    
    var body: some View {
        Form {
            Picker("Map Zoom:", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }
            .pickerStyle(InlinePickerStyle())
        }
        .frame(width: 300)
        .navigationTitle("Landmark Settings")
        .padding(80)

    }
}

struct LandmrkSettings_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkSettings()
    }
}
