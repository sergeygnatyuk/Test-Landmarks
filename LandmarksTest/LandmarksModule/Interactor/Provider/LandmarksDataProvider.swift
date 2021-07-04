import Foundation

final class LandmarksDataProvider: ILandmarksDataProvider {
    
    // MARK: - Public
    func getDataFromJSON(completion: ((Result<Data, Error>) -> Void)) {
        completion(.success(Data()))
    }
}
