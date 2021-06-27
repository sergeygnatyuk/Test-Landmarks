import UIKit
import SnapKit

class LandmarksViewController: UIViewController {
    
    // MARK: - Model
    struct Model {
        struct Location {
            let name: String
            let category: String
            let city: String
            let state: String
            let id: Int
            let park: String
            let coordinates: Coordinates
            let imageName: String
            let isFavourite: Bool
        }

        struct Coordinates {
            let longitude: Double
            let latitude: Double
        }
    }
    
    // MARK: - Properties
    let cellIdentifier = "Cell"
    let titleNavigationController = "Landmarks"
    var landmarksView: LandmarksView = {
        let view = LandmarksView()
        return view
    }()
    
    // MARK: - Dependencies
    let interactor: ILandmarksInteractor
    let router: ILandmarksRouter
    
    // MARK: - Initialization
    init(interactor: ILandmarksInteractor, router: ILandmarksRouter) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = titleNavigationController
        view.backgroundColor = UIColor().colorFromHex(Color.white.rawValue)
        interactor.viewDidLoad()
        setTableViewDelegates()
        setupUIElements()
        
    }
    
    // MARK: - UI
    private func setupUIElements() {
        view.addSubview(tableView)
        setupConstraints()
    }
    
    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(LandmarksCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.isHidden = false
        tableView.rowHeight = 70
        return tableView
    }()
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { maker in
            maker.top.trailing.leading.bottom.equalToSuperview()
        }
    }
    
    // MARK: - @objc methods
    @objc private func actionButtonDidPressed() {
        router.showDetailsScreen()
    }
}

// MARK: - ILandmarksView
extension LandmarksViewController: ILandmarksView {
    func updateUI(with viewModel: Model) {
        //        nameLabel.text = viewModel.nameLabelText
        let imageView = LandmarksCell()
        //imageView.imageView?.image =
    }
}


