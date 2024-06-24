import UIKit

class TotalPointsView: UIView {
    
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

extension TotalPointsView {
    
    //MARK: Methods
    
    func configureView() {
        guard let totalPointsView = Bundle.main.loadNibNamed("TotalPointsView", owner: self)?.first as? UIView else { return }
        totalPointsView.frame = self.bounds
        self.addSubview(totalPointsView)
    }
}
