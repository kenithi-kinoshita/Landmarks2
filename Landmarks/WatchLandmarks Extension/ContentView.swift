//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by 木下健一 on 2021/08/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
