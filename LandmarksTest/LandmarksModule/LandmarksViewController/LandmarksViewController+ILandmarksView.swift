import Foundation

extension LandmarksViewController: ILandmarksView {
    
    // MARK: - Public
    public func updateUI(with viewModel: [Landmarks]) {
        allLandmarks = viewModel
        favoriteLandmark = allLandmarks.filter({ $0.isFavorite })
        tableView.reloadData()
    }
    
    public func update(with error: String) {
    }
}
