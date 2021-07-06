import UIKit
import MapKit

class DetailsLandmarksDataProvider: IDetailsLandmarksDataProvider {
    
    // MARK: - Dependencies
    //var dataStore: Landmarks?
   // let service: DetailedLandmarkService

//    init(dataStore: Landmarks, service: DetailedLandmarkService) {
//        self.dataStore = dataStore
//        self.service = service
//    }

    func getItems(completion: @escaping ((Result<Landmarks, ErrorType>) -> Void)) {
//        if dataStore?.id != 0 {
//            completion()
//            return completion(self.dataStore, nil)
//        }
//        service.fetchItems { (array, error) in
//            if error != nil {
//                completion(.failure(.parsingError))
//                //completion(nil, .invalidBundle)
//            } else if let models = array {
//                self.dataStore = models
//                completion(self.dataStore, nil)
//
//            }
//        }
        
        
    }
    
    func parseData(state: Landmarks, controller: DetailLandmarksViewController) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: state.locationCoordinate , span: span)
        controller.detailView.imageView.image = ImageStore.shared.image(name: state.imageName)
        controller.detailView.checkIsFavorite(isFavorite: state.isFavorite )
        controller.detailView.mapView.setRegion(region, animated: true)
        controller.detailView.nameLabel.text = state.name
        controller.detailView.parkLabel.text = state.park
        controller.detailView.stateLabel.text = state.state
        controller.title = state.name
    }
}

//region
//uiimage
//isFavorite
//landmark name
//park name
//state text


