import UIKit

class MatchVC: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    
    let matchViewModel = MatchViewModel(service: APIService())
    
    //MARK: Constants
    
    let tableHeaderHeight = 80.0
    let cellHeight = 120.0
    
    //MARK: Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUIComponents()
        Loader.shared.showOverlay(view: self.view)
        
        matchViewModel.postRequest { matchList, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.showAlertMessage(title: "Alert", message: error.rawValue)
                }
            } else {
                DispatchQueue.main.async {
                    if self.matchViewModel.matchList.count == 0 {
                        self.showAlertMessage(title: "Alert", message: "No matches currently.")
                    } else {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
}
