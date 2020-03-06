import UIKit
import RxSwift
import RxCocoa

final class TweetLogViewController: UIViewController {
    
    @IBOutlet weak var tweetLogTableView: UITableView!
    
    var routing: TweetLogRoutingProtocol?
    var viewModel: TweetLogViewModelProtocol?
    private let disposeBag: DisposeBag = DisposeBag()
    
    private let dataSource = TweetLogTableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        syncReload()
    }
    
    private func setupViews() {
        tweetLogTableView.dataSource = dataSource
        tweetLogTableView.delegate = dataSource
        
        tweetLogTableView.register(UINib(nibName: TweetLogSectionView.className, bundle: nil),
                                   forHeaderFooterViewReuseIdentifier: TweetLogSectionView.className)
    }
    
    private func syncReload() {
        // 要修正
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.tweetLogTableView.reloadData()
        }
    }
}

// データ繋ぎ込み
// nibファイル化
