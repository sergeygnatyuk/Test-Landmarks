import UIKit
import SnapKit

class LandmarksViewController: UIViewController {
    // MARK: - Properties
    let cellIdentifier = "Cell"
    let titleNavigationController = "Landmarks"
    let data = landmarkData
    var cell: LandmarksCell = {
        let cell = LandmarksCell()
        return cell
    }()
    
    // MARK: - Dependencies
    var selectedLandmark: Landmark?
    var presenter: ILandmarksPresenter?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = titleNavigationController
        view.backgroundColor = UIColor().colorFromHex(Color.white.rawValue)
        setTableViewDelegates()
        setupUIElements()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
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
}

// MARK: - ILandmarksView
extension LandmarksViewController: ILandmarksView {
    func updateUI(with viewModel: Landmark) {
    }
    
    func update(with error: String) {
    }
}


