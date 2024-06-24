
import UIKit

// Protocol
protocol HandleSegemnts: AnyObject {
    func handleSegmentNavigation(_ view: UIView)
    func handleBack()
}

class HeaderView: UIView {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var homeTeamLogo: UIImageView!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var currentScore: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var favouritesBtn: UIButton!
    
    //MARK: Variables
    
    weak var delegate: HandleSegemnts?
      
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    //MARK: IBActions
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        segmentedControl.underlinePosition()
        let rect = CGRect(x: 0, y: 0, width: self.frame.width, height: UIScreen.main.bounds.height - self.frame.height + safeAreaHeight)
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let overviewView = OverviewView(frame: rect)
            delegate?.handleSegmentNavigation(overviewView)
        case 1:
            let statsView = StatsView(frame: rect)
            delegate?.handleSegmentNavigation(statsView)
        case 2:
            let oddsView = OddsView(frame: rect)
            delegate?.handleSegmentNavigation(oddsView)
        case 3:
            let h2hView = H2HView(frame: rect)
            delegate?.handleSegmentNavigation(h2hView)
        case 4:
            let chatView = ChatView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: UIScreen.main.bounds.height - self.frame.height - safeAreaHeight))
            delegate?.handleSegmentNavigation(chatView)
        default:
            delegate?.handleSegmentNavigation(UIView(frame: .zero))
        }
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        delegate?.handleBack()
    }
}

extension HeaderView {
    
    //MARK: Methods
    
    func configureView() {
        guard let headerView = Bundle.main.loadNibNamed("HeaderView", owner: self)?.first as? UIView else { return }
        headerView.frame = self.bounds
        self.addSubview(headerView)
        
        configureUIComponents()
    }
    
    func configureUIComponents() {
        segmentedControl.highlightSelectedSegment()
        favouritesBtn.layer.cornerRadius = cornerRadius10
    }
}
