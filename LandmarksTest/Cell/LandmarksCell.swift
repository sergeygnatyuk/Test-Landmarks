import UIKit
import SnapKit

class LandmarksCell: UITableViewCell {
    // MARK: - UI
    lazy var cellImageView: UIImageView = {
        let cellImageView = UIImageView()
        cellImageView.clipsToBounds = true
        cellImageView.isUserInteractionEnabled = true
        return cellImageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: MyConstants.fontSizeLabels.rawValue)
        titleLabel.adjustsFontSizeToFitWidth = false
        return titleLabel
    }()
    
    lazy var starLabel: UILabel = {
        let starLabel = UILabel()
        starLabel.numberOfLines = 0
        starLabel.text = "⭐️"
        starLabel.adjustsFontSizeToFitWidth = false
        return starLabel
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override
    override func layoutSubviews() {
        super.layoutSubviews()
        cellImageView.layer.cornerRadius = cellImageView.frame.height / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImageView.image = nil
        starLabel.isHidden = true
    }
    
    // MARK: - Private
    private func createSubviews() {
        contentView.addSubview(cellImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(starLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        cellImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(MyConstants.imageTrailing.rawValue)
            make.centerY.equalToSuperview()
            make.size.equalTo(MyConstants.imageSize.rawValue)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(cellImageView.snp.trailing).offset(8)
        }
        
        starLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.greaterThanOrEqualToSuperview().offset(32)
            make.leading.equalTo(titleLabel.snp.trailing).offset(2)
        }
    }
    
   public func checkIsFavorite(isFavorite: Bool) {
        starLabel.isHidden = !isFavorite
    }
    
    func setup(with model: Landmark) {
        titleLabel.text = model.name
        cellImageView.image = ImageStore.shared.image(name: model.imageName)
    }
}


