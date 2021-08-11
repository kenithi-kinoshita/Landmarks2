//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by 木下健一 on 2021/08/11.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where:  { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    MapView(coordinate: landmark.locationCoordinate)
                        .ignoresSafeArea(edges: .top)
                        .frame(height: 300)
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleImage(image: landmark.image)

                            VStack(alignment: .leading) {
                                HStack {
                                    Text(landmark.name)
                                        .font(.title)
                                        .foregroundColor(.primary)
                                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                        .buttonStyle(PlainButtonStyle())
                                }

                                VStack(alignment: .leading) {
                                    Text(landmark.park)
                                    Text(landmark.state)
                                }
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            }
                    }
                
                    Divider()

                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
            }
            .padding()
            .offset(y: -50)
            }
            .navigationTitle(landmark.name)

    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
            .frame(width: 850, height: 700)
    }

}
