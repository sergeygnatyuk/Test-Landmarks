import Foundation

extension LandmarksViewController: ILandmarksView {
    
    func updateUI(with viewModel: [Landmarks]) {
        allLandmarks = viewModel
        favoriteLandmark = allLandmarks.filter({ $0.isFavorite })
        tableView.reloadData()
    }
    
    func update(with error: String) {
    }
}
