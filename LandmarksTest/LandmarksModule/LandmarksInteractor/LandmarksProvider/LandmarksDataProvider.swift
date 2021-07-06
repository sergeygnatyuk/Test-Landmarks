import UIKit

final class LandmarksDataProvider: ILandmarksDataProvider {
    
    // MARK: - Public
    public func getDataFromJSON(completion: ((Result<[Landmarks], Error>) -> Void)) {
        let data: Data
        guard let file = Bundle.main.url(forResource: Name.fileName, withExtension: ".json") else {
            completion(.failure(ErrorType.invalidBundle))
            fatalError("Couldn't find \(Name.fileName) in main bundle.")
        }
        do {
            data = try Data(contentsOf: file)
            let decoder = JSONDecoder()
            let result = try decoder.decode([Landmarks].self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(ErrorType.parsingError))
        }
    }
}

enum ErrorType: Error {
    case invalidBundle
    case parsingError
}
