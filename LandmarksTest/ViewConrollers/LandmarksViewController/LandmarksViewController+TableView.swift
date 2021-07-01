import UIKit

extension LandmarksViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return MyConstants.heightFirstCell.rawValue
        } else {
            return MyConstants.heightSecondCell.rawValue
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return landmarkData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let isFavoriteCell = tableView.dequeueReusableCell(withIdentifier: isFavoriteCellIdentifier, for: indexPath) as? IsFavoriteCell
            isFavoriteCell?.selectionStyle = .none
            isFavoriteCell?.isFavoriteSwitch.tag = indexPath.row
            isFavoriteCell?.favoritesOn = { isOn in
                if isOn {
                    tableView.reloadSections(IndexSet(1...1), with: .automatic)
                } else {
                    print("456")
                }
            }
            return isFavoriteCell ?? UITableViewCell()
        }
        let landmarksCell = tableView.dequeueReusableCell(withIdentifier: landmarksCellIdentifier, for: indexPath) as? LandmarksCell
        let landmark = data[indexPath.row]
        landmarksCell?.titleLabel.text = landmark.name
        landmarksCell?.accessoryType = .disclosureIndicator
        landmarksCell?.landmarksImageView.image = ImageStore.shared.image(name: landmark.imageName)
        landmarksCell?.checkIsFavorite(isFavorite: landmark.isFavorite)
        return landmarksCell ?? UITableViewCell()
    }
}
