import Foundation
import MapKit
import UIKit

class DetailsLandmarksPresenter: IDetailsLandmarksPresenter {
    
    // MARK: - Properties
    var view: IDetailsLandmarksView?
    
    init() {
    }
    
    // MARK: - Public
//    public func interactorDidFetchUsers(with result: Result<DetailedLandmarkViewModel, Error>) {
//        switch result {
//        case .success(let landmarks):
//            view?.updateUI(with: landmarks)
//        case .failure(let error):
//            view?.update(with: error.localizedDescription)
//        }
//    }
    
    
    func prepareViewModel(for landmark: Landmarks) {
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
