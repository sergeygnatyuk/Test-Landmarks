import Foundation

protocol IDataProvider: AnyObject {
    func getDataFromJSON(completion: ((Result<Data, Error>) -> Void))
}

