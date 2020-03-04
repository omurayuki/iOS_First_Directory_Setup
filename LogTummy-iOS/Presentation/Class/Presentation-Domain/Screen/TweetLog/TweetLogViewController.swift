import UIKit
import RxSwift
import RxCocoa

final class TweetLogViewController: UIViewController {
    
    @IBOutlet weak var tweetLogTableView: UITableView!
    
    var arr = [true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetLogTableView.dataSource = self
        tweetLogTableView.delegate = self
        let xib = UINib(nibName: "TweetLogSectionView", bundle: nil)
        tweetLogTableView.register(xib, forHeaderFooterViewReuseIdentifier: "TweetLogSectionView")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tweetLogTableView.reloadData()
        }
    }
}

extension TweetLogViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TweetLogSectionView") as! TweetLogSectionView
        return headerFooterView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetLogTableViewCell", for: indexPath) as! TweetLogTableViewCell
        cell.configure(arr)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if (offsetY <= 100 && offsetY >= 0) {
            scrollView.contentInset = UIEdgeInsets(top: -offsetY, left: 0, bottom: 0, right: 0)
        }
    }
}
