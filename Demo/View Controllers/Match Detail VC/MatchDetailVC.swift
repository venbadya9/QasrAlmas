import UIKit

class MatchDetailVC: UIViewController {
    
    //MARK: IBOutelts
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variables
    
    var segmentView: UIView?
    var matchId: String!
    var matchDetailViewModel: MatchDetailViewModel!
    var statsView: StatsView!
    
    //MARK: Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUIComponents()
        Loader.shared.showOverlay(view: self.view)
        matchDetailViewModel = MatchDetailViewModel(service: APIService(), matchId: matchId)
        
        matchDetailViewModel.postRequest { matchDetail, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.showAlertMessage(title: "Alert", message: error.rawValue)
                }
            } else {
                DispatchQueue.main.async {
                    self.updateUI()
                }
            }
        }
    }
}
