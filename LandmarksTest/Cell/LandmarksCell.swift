import UIKit
import SnapKit

 class LandmarksCell: UITableViewCell {
    // MARK: - UI
    lazy var landmarksImageView: UIImageView = {
        let landmarksImageView = UIImageView()
        landmarksImageView.clipsToBounds = true
        landmarksImageView.translatesAutoresizingMaskIntoConstraints = false
        landmarksImageView.isUserInteractionEnabled = true
        return landmarksImageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: MyConstants.fontSizeLabels.rawValue)
        titleLabel.adjustsFontSizeToFitWidth = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var starLabel: UILabel = {
        let starImageView = UILabel()
        starImageView.numberOfLines = 0
        starImageView.text = "⭐️"
        starImageView.adjustsFontSizeToFitWidth = false
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        return starImageView
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUICell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override
    override func layoutSubviews() {
        super.layoutSubviews()
        landmarksImageView.layer.cornerRadius = landmarksImageView.frame.height / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        landmarksImageView.image = nil
        starLabel.isHidden = true
    }
    
    // MARK: - Private
    private func setupUICell() {
        contentView.addSubview(landmarksImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(starLabel)
        setupLayout()
    }
    
    private func setupLayout() {
        landmarksImageView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().inset(MyConstants.imageTrailing.rawValue)
            maker.centerY.equalToSuperview()
            maker.size.equalTo(MyConstants.imageSize.rawValue)
        }
        
        titleLabel.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.leading.equalTo(landmarksImageView.snp.trailing).offset(8)
        }
        
        starLabel.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.trailing.greaterThanOrEqualToSuperview().offset(32)
            maker.leading.equalTo(titleLabel.snp.trailing).offset(2)
        }
    }
    
    func checkIsFavorite(isFavorite: Bool) {
        starLabel.isHidden = !isFavorite
    }
}


