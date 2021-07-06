import UIKit
import SnapKit

final class FavoriteCell: UITableViewCell {
    
    // MARK: - Properties
    public var favoritesOn: ((_ isOn: Bool) -> Void)?
    
    // MARK: - UI
    private lazy var favoriteLabel: UILabel = {
        let favoriteLabel = UILabel()
        favoriteLabel.numberOfLines = Int(Size.zero.rawValue)
        favoriteLabel.font = UIFont.systemFont(ofSize: Size.fontSizeLabels.rawValue)
        favoriteLabel.text = "Favorites only"
        favoriteLabel.adjustsFontSizeToFitWidth = false
        return favoriteLabel
    }()
    
    lazy var isFavoriteSwitch: UISwitch = {
        let isFavoriteSwitch = UISwitch()
        isFavoriteSwitch.setOn(false, animated: true)
        isFavoriteSwitch.addTarget(self, action: #selector(isFavoriteSorted), for: .valueChanged)
        return isFavoriteSwitch
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    private func createSubviews() {
        contentView.addSubview(favoriteLabel)
        contentView.addSubview(isFavoriteSwitch)
    }
    
    private func setupConstraints() {
        favoriteLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(Size.imageTrailing.rawValue)
        }
        
        isFavoriteSwitch.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(Size.switchTrailing.rawValue)
        }
    }
    
    // MARK: - @objc methods
    @objc func isFavoriteSorted() {
        if isFavoriteSwitch.isOn == true {
            favoritesOn?(true)
        } else {
            favoritesOn?(false)
        }
    }
}
