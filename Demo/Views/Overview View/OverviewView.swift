import UIKit

class OverviewView: UIView {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var eventView: UIView!
    @IBOutlet weak var venueView: UIView!
    @IBOutlet weak var weatherView: UIView!
    
    @IBOutlet var container: [UIView]!
    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
}

extension OverviewView {
    
    //MARK: Methods
    
    func configureView() {
        guard let overviewView = Bundle.main.loadNibNamed("OverviewView", owner: self)?.first as? UIView else { return }
        overviewView.frame = self.bounds
        self.addSubview(overviewView)

        configureUIComponents()
    }
    
    func configureUIComponents() {
        [eventView, venueView, weatherView].forEach { view in
            view?.layer.cornerRadius = cornerRadius12
        }
        
        for view in container {
            view.layer.cornerRadius = containerRadius
        }
    }
}
