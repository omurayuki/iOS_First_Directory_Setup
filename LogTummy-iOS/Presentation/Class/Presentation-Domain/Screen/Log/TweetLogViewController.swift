import UIKit
import RxSwift
import RxCocoa

final class TweetLogViewController: UIViewController {
    
    @IBOutlet weak var tweetLogTableView: UITableView!
    
    var arr = ["😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆", "😆"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetLogTableView.dataSource = self
        tweetLogTableView.delegate = self
    }
}

extension TweetLogViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetLogTableViewCell", for: indexPath) as! TweetLogTableViewCell
        cell.configure(with: self.arr)
        return cell
    }
}
