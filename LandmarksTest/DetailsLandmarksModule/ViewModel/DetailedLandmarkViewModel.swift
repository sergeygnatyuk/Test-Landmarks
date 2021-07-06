//
//  DetailedLandmarkViewModel.swift
//  LandmarksTest
//
//  Created by Гнатюк Сергей on 06.07.2021.
//

import UIKit
import MapKit

struct DetailedLandmarkViewModel {
    var region: MKCoordinateRegion
    var image: UIImage
    var isFavourite: Bool
    var name: String
    var parkName: String
    var state: String
}
