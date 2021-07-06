import UIKit

class DetailLandmarksViewController: UIViewController {
    
    // MARK: - Properties
    var landmark: Landmarks?
    let landmarkDetail = [Landmarks]()
    var interactor: IDetailsLandmarksInteractor
    var detailView: DetailView = {
        let detailView = DetailView()
        return detailView
    }()
    
    init(interactor: IDetailsLandmarksInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.getData(forLandmark: landmark!)
        view.backgroundColor = UIColor().colorFromHex(Colors.white.rawValue)
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = true
        detailView.addSubviews()
        detailView.setupConstraints()
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailView.imageView.layer.cornerRadius = detailView.imageView.frame.height / MyConstants.two.rawValue
    }
}

extension DetailLandmarksViewController: IDetailsLandmarksView {

    
    func updateUI(with viewModel: DetailedLandmarkViewModel) {
        detailView.imageView.image = viewModel.image
        detailView.checkIsFavorite(isFavorite: viewModel.isFavourite)
        detailView.mapView.setRegion(viewModel.region, animated: true)
        detailView.nameLabel.text = viewModel.name
        detailView.parkLabel.text = viewModel.parkName
        detailView.stateLabel.text = viewModel.state
        title = viewModel.name
    }
    
    func update(with error: String) {
        
    }
    
    
}
