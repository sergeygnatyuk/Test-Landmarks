import UIKit
import MapKit


class DetailsLandmarksDataProvider: IDetailsLandmarksDataProvider {
    
    // MARK: - Dependencies
    var dataStore: Landmarks?
    let service: DetailedLandmarkService

    init(dataStore: Landmarks, service: DetailedLandmarkService) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping (Landmarks?, ErrorType?) -> Void) {
        if dataStore?.id != 0 {
            return completion(self.dataStore, nil)
        }
        service.fetchItems { (array, error) in
            if error != nil {
                completion(nil, .invalidBundle)
            } else if let models = array {
                self.dataStore = models
                completion(self.dataStore, nil)
            }
        }
    }
}
