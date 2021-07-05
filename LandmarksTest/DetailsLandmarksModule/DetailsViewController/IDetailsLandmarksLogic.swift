import Foundation

protocol DetailedLandmarkLogic: class {
    func displayLandmark(viewModel: DetailedLandmark.GetDetailsCase.ViewModel)
}

protocol DetailedLandmarkBusinessLogic {
    func getLandmarkData(request: DetailedLandmark.GetDetailsCase.Request)
}
