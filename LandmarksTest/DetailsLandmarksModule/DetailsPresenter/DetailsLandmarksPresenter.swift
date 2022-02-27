import Foundation
import MapKit
import UIKit

final class DetailsLandmarksPresenter: IDetailsLandmarksPresenter {
    
    // MARK: - Properties
    var view: IDetailsLandmarksView?
    
    init() {
    }
    
    // MARK: - Public
   public func prepareViewModel(for landmark: LandmarksModel) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: landmark.locationCoordinate , span: span)
        let image = ImageStore.shared.image(name: landmark.imageName)
        let isFavorite = landmark.isFavorite
        let name = landmark.name
        let parkName = landmark.park
        let state = landmark.state
        let viewModel = DetailedLandmarkViewModel(region: region, image: image, isFavourite: isFavorite, name: name, parkName: parkName, state: state)
        view?.updateUI(with: viewModel)
    }
}
