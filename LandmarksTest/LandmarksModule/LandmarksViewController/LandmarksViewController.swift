import UIKit
import MapKit

class LandmarksViewController: UITableViewController {
    
    // MARK: - Properties
    let defaultImage = "chilkoottrail"
    var allLandmarks = [Landmarks]()
    var favoriteLandmark = [Landmarks]()
    let detailViewController = DetailLandmarksViewController()
    var showFavorite = false {
        didSet {
            tableView.reloadSections(IndexSet(1...1), with: .automatic)
        }
    }
    
    // MARK: - Dependencies
    var selectedLandmark: Landmarks?
    internal var interactor: ILandmarksInteractor
    
    // MARK: - Initialization
    init(interactor: ILandmarksInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.getData()
        setupTableView()
        title = "Landmarks"
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - TableViewDataSource && Delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            if showFavorite {
                return favoriteLandmark.count
            } else {
                return allLandmarks.count
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = showFavorite ? favoriteLandmark : allLandmarks
        if indexPath.section == 0 {
            guard let isFavoriteCell = tableView.dequeueReusableCell(withIdentifier: Identifiers.favoriteCellIdentifier, for: indexPath) as? FavoriteCell else { fatalError() }
            isFavoriteCell.selectionStyle = .none
            isFavoriteCell.isFavoriteSwitch.tag = indexPath.row
            isFavoriteCell.favoritesOn = { isOn in
                if isOn {
                    self.showFavorite = true
                } else {
                    self.showFavorite = false
                }
            }
            return isFavoriteCell
        }
        guard let landmarksCell = tableView.dequeueReusableCell(withIdentifier: Identifiers.landmarksCellIdentifier, for: indexPath) as? LandmarksCell else { fatalError() }
        let landmark = data[indexPath.row]
        landmarksCell.setup(with: landmark)
        landmarksCell.accessoryType = .disclosureIndicator
        landmarksCell.checkIsFavorite(isFavorite: landmark.isFavorite)
        return landmarksCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return MyConstants.heightFirstCell.rawValue
        } else {
            return MyConstants.heightSecondCell.rawValue
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            return
        } else {
            if showFavorite {
                selectedLandmark = favoriteLandmark[indexPath.row]
            } else {
                selectedLandmark = allLandmarks[indexPath.row]
            }
            navigationController?.pushViewController(detailViewController, animated: true)
            parseData()
        }
    }
    
    // MARK: - Private
    private func setupTableView() {
        tableView.register(LandmarksCell.self, forCellReuseIdentifier: Identifiers.landmarksCellIdentifier)
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: Identifiers.favoriteCellIdentifier)
    }
    
    private func parseData() {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: selectedLandmark?.locationCoordinate ?? CLLocationCoordinate2D(latitude: 12, longitude: 12), span: span)
        detailViewController.detailView.imageView.image = ImageStore.shared.image(name: selectedLandmark?.imageName ?? defaultImage)
        detailViewController.detailView.checkIsFavorite(isFavorite: selectedLandmark?.isFavorite ?? true)
        detailViewController.detailView.mapView.setRegion(region, animated: true)
        detailViewController.detailView.nameLabel.text = selectedLandmark?.name
        detailViewController.detailView.parkLabel.text = selectedLandmark?.park
        detailViewController.detailView.stateLabel.text = selectedLandmark?.state
        detailViewController.title = selectedLandmark?.name
        
    }
}



