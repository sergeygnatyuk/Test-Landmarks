import Foundation

final class DataProvider: IDataProvider {
    
    // MARK: - Public
    func getDataFromJSON(completion: ((Result<Data, Error>) -> Void)) {
        completion(.success(Data()))
    }
}
