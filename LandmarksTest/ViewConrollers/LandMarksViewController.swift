import UIKit

final class LandMarksViewController: UIViewController {
    
    struct Model {
        let nameLabelText: String
    }
    
    // UI создать отдельным файлом и подтянуть
    private lazy var nameLabel = UILabel()
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(actionButtonDidPressed), for: .touchUpInside)
    }()
    
    // Dependencies
    private let interactor: ILandmarksInteractor
    private let router: ILandmarksRouter
    
    //Initialization
    internal init(interactor: ILandmarksInteractor, router: ILandmarksRouter) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.viewDidLoad()
    }
    
    // MARK: - @objc methods
    @objc private func actionButtonDidPressed() {
        router.showDetailsScreen()
    }
}

// MARK: - ILandmarksView
extension LandMarksViewController: ILandmarksView {
    func updateUI(with viewModel: Model) {
        nameLabel.text = viewModel.nameLabelText
    }
}


