import UIKit

extension LandmarksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? LandmarksCell
        let landmark = data[indexPath.row]
        cell?.titleLabel.text = landmark.name
        cell?.accessoryType = .disclosureIndicator
        cell?.landmarksImageView.image = ImageStore.shared.image(name: landmark.imageName)
        return cell ?? UITableViewCell()
    }
}
