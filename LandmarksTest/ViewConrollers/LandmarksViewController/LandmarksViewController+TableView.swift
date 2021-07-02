//import UIKit
//
//extension LandmarksViewController: UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//            return MyConstants.heightFirstCell.rawValue
//        } else {
//            return MyConstants.heightSecondCell.rawValue
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let isFavoriteCell = IsFavoriteCell()
//        if section == 0 {
//            return 1
//        } else {
//            isFavoriteCell.favoritesOn = { isOn in
//                if isOn {
//                    self.data = landmarkData.filter({ $0.isFavorite })
//                } else {
//                    self.data = landmarkData
//                }
//            }
//            return data.count
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            guard let isFavoriteCell = tableView.dequeueReusableCell(withIdentifier: isFavoriteCellIdentifier, for: indexPath) as? IsFavoriteCell else {fatalError() }
//            isFavoriteCell.selectionStyle = .none
//            isFavoriteCell.isFavoriteSwitch.tag = indexPath.row
//            isFavoriteCell.favoritesOn = { isOn in
//                if isOn {
//                    self.data = landmarkData.filter({ $0.isFavorite })
//                    tableView.reloadSections(IndexSet(1...1), with: .automatic)
//                } else {
//                    self.data = landmarkData
//                    tableView.reloadSections(IndexSet(1...1), with: .automatic)
//                }
//            }
//            return isFavoriteCell
//        }
//        guard let landmarksCell = tableView.dequeueReusableCell(withIdentifier: landmarksCellIdentifier, for: indexPath) as? LandmarksCell else { fatalError() }
//        let landmark = data[indexPath.row]
//        landmarksCell.setup(with: landmark)
//        landmarksCell.accessoryType = .disclosureIndicator
//        return landmarksCell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailViewController = DetailLandmarksViewController()
//        selectedLandmark = data[indexPath.row]
//        tableView.deselectRow(at: indexPath, animated: true)
//        // navigationController?.show(detailViewController, sender: nil)
//        navigationController?.pushViewController(detailViewController, animated: true)
//    }
//}
