import Foundation

final class LandmarksInteractor: ILandmarksInteractor{
    // Dependencies
    private let presenter: ILandmarksPresenter
    private let dataProvider: IDataProvider
    
    // Initialization
    init(presenter: ILandmarksPresenter, dataProvider: IDataProvider) {
        self.presenter = presenter
        self.dataProvider = dataProvider
    }
    
    // MARK: - Public
    func viewDidLoad() {
        loadData()
    }
    
    // MARK: - Private
   private func loadData() {
        dataProvider.getDataFromJSON { result in
            switch result {
            case .success(let data):
                guard let location = self.serializedData(data: data) else { return }
                self.presenter.makeViewModels(with: location)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func serializedData(data: Data) -> Location? {
        return Location(name: "london", category: "12", city: "asd", state: "das", id: 12, park: "das", coordinates: Coordinates.init(longitude: 12, latitude: 12), imageName: "12", isFavourite: true)
    }
}
