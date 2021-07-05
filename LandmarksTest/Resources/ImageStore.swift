import UIKit

final class ImageStore {
    
    // MARK: - Properties
    static var shared = ImageStore()
    
    // MARK: - Public
    public func image(name: String) -> UIImage {
        return UIImage(named: name) ?? UIImage()
    }
}
