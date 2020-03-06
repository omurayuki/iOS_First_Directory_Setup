import UIKit

final class TweetLogTableViewDataSource: NSObject {
    
    struct Constant {
        static let numberOfRows = 1
        static let sections = 1
        static let headerHeight: CGFloat = 80
        static let scrollHeight: CGFloat = 100
    }
    var arr = [true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true, true, false, false, true, true]
}

extension TweetLogTableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constant.numberOfRows
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constant.sections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetLogTableViewCell.className, for: indexPath) as? TweetLogTableViewCell
        else { return UITableViewCell() }
        cell.configure(arr)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if (offsetY <= Constant.scrollHeight && offsetY >= 0) {
            scrollView.contentInset = UIEdgeInsets(top: -offsetY, left: 0, bottom: 0, right: 0)
        }
    }
}

extension TweetLogTableViewDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constant.headerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            let headerFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TweetLogSectionView.className) as? TweetLogSectionView
        else { return UIView() }
        return headerFooterView
    }
}
