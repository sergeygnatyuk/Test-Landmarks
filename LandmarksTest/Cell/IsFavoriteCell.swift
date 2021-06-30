import UIKit
import SnapKit

final class IsFavoriteCell: UITableViewCell {
    
    // MARK: - Properties
    let favoriteTextLabel = "Favorites only"
    
    // MARK: - UI
    private lazy var favoriteLabel: UILabel = {
        let favoriteLabel = UILabel()
        favoriteLabel.numberOfLines = 0
        favoriteLabel.font = UIFont.systemFont(ofSize: MyConstants.fontSizeLabels.rawValue)
        favoriteLabel.text = favoriteTextLabel
        favoriteLabel.adjustsFontSizeToFitWidth = false
        favoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        return favoriteLabel
    }()
    
    lazy var isFavoriteSwitch: UISwitch = {
        let isFavoriteSwitch = UISwitch()
        isFavoriteSwitch.setOn(false, animated: true)
        isFavoriteSwitch.addTarget(self, action: #selector(isFavoriteSorted), for: .touchUpOutside)
        return isFavoriteSwitch
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUICell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    private func setupUICell() {
        addSubview(favoriteLabel)
        contentView.addSubview(isFavoriteSwitch)
        setupLayout()
    }
    
    private func setupLayout() {
        favoriteLabel.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.leading.equalToSuperview().inset(MyConstants.imageTrailing.rawValue)
        }
        
        isFavoriteSwitch.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.trailing.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - @objc methods
    @objc func isFavoriteSorted() {
        if isFavoriteSwitch.isOn {
            
        }
    }
}
