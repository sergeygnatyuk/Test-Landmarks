import Foundation

enum DetailedLandmark {
    enum GetDetailsCase {
        struct Request {
        }

        struct Response {
            var result: DetailedLandmarkRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum DetailedLandmarkRequestResult {
        case failure(DetailedLandmarkError)
        case success(Landmarks)
    }

    enum ViewControllerState {
        case loading
        case result(Landmarks)
        case emptyResult
        case error(message: String)
    }

    enum DetailedLandmarkError: Error {
        case someError(message: String)
    }
}
