//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Sergei Nazarenko on 20.09.2021.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter{landmark in
            (!showFavoriteOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoriteOnly, label: {
                    Text("Favorites only")
                })
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        //        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
        LandmarkList()
            .environmentObject(ModelData())
        //                .previewDevice(PreviewDevice(rawValue: deviceName))
        //                .previewDisplayName(deviceName)
        //        }
    }
}
