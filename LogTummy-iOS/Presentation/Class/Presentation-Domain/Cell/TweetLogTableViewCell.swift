import UIKit

class TweetLogTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    var arr: [Bool] = []
    
    func configure(_ arr: [Bool]) {
        self.arr = arr
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
    }
}

extension TweetLogTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TweetLogCollectionViewCell", for: indexPath) as! TweetLogCollectionViewCell
        cell.configure(arr[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30.0, height: 30.0)
    }
}
