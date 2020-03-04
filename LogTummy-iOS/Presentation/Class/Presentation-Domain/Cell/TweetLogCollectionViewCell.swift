import UIKit

class TweetLogCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ bool: Bool) {
        bool ? (backgroundColor = .systemBlue) : (backgroundColor = .systemGray)
    }
}
