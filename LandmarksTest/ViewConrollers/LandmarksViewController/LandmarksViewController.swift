import UIKit
import MapKit
import SnapKit

class LandmarksViewController: UITableViewController {
    // MARK: - Properties
    let landmarksCellIdentifier = "LandmarksCell"
    let isFavoriteCellIdentifier = "IsFavoriteCell"
    let titleNavigationController = "Landmarks"
    var data = landmarkData
    
    // MARK: - Dependencies
    var selectedLandmark: Landmark?
    var presenter: ILandmarksPresenter?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = titleNavigationController
        view.backgroundColor = UIColor().colorFromHex(Color.white.rawValue)
    }
    
    // MARK: - UI
    private func setupTableView() {
        tableView.register(LandmarksCell.self, forCellReuseIdentifier: landmarksCellIdentifier)
        tableView.register(IsFavoriteCell.self, forCellReuseIdentifier: isFavoriteCellIdentifier)
    }
}

// MARK: - ILandmarksView
extension LandmarksViewController: ILandmarksView {
    func updateUI(with viewModel: Landmark) {
    }
    func update(with error: String) {
    }
    
    // MARK: - TableViewDelegates
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return MyConstants.heightFirstCell.rawValue
        } else {
            return MyConstants.heightSecondCell.rawValue
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let isFavoriteCell = tableView.dequeueReusableCell(withIdentifier: isFavoriteCellIdentifier, for: indexPath) as? IsFavoriteCell else {fatalError() }
            isFavoriteCell.selectionStyle = .none
            isFavoriteCell.isFavoriteSwitch.tag = indexPath.row
            isFavoriteCell.favoritesOn = { isOn in
                if isOn {
                    self.data = landmarkData.filter({ $0.isFavorite })
                    tableView.reloadSections(IndexSet(1...1), with: .automatic)
                } else {
                    self.data = landmarkData
                    tableView.reloadSections(IndexSet(1...1), with: .automatic)
                }
            }
            return isFavoriteCell
        }
        guard let landmarksCell = tableView.dequeueReusableCell(withIdentifier: landmarksCellIdentifier, for: indexPath) as? LandmarksCell else { fatalError() }
        let landmark = data[indexPath.row]
        landmarksCell.setup(with: landmark)
        landmarksCell.accessoryType = .disclosureIndicator
        landmarksCell.checkIsFavorite(isFavorite: landmark.isFavorite)
        return landmarksCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailLandmarksViewController()
        selectedLandmark = data[indexPath.row]
        detailViewController.detailView.imageView.image = ImageStore.shared.image(name: selectedLandmark?.imageName ?? "chilkoottrail")
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: selectedLandmark?.locationCoordinate ?? CLLocationCoordinate2D(latitude: 12, longitude: 12), span: span)
        detailViewController.detailView.mapView.setRegion(region, animated: true)
        detailViewController.detailView.nameLabel.text = selectedLandmark?.name
      //  detailViewController.title = selectedLandmark?.name.lowercased()
        // tableView.deselectRow(at: indexPath, animated: true)
        // navigationController?.show(detailViewController, sender: nil)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    // MARK: - Private
    private func favoriteSection(_ section: Int) -> Int {
        let isFavoriteCell = IsFavoriteCell()
        if section == 0 {
            return 1
        } else {
            isFavoriteCell.favoritesOn = { isOn in
                if isOn {
                    self.data = landmarkData.filter({ $0.isFavorite })
                } else {
                    self.data = landmarkData
                }
            }
            return data.count
        }
    }
}


