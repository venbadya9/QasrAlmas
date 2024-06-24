import UIKit

class PlayerView: UIView {
    
    //MARK: IBOutelts
    
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet var currentSetViewCollection: [UIView]!
    
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

extension PlayerView {
    
    //MARK: Methods
    
    func configureView() {
        guard let playerView = Bundle.main.loadNibNamed("PlayerView", owner: self)?.first as? UIView else { return }
        playerView.frame = self.bounds
        self.addSubview(playerView)
        
        configureUIComponents()
    }
    
    func configureUIComponents() {
        for view in currentSetViewCollection {
            view.layer.cornerRadius = cornerRadius12
        }
    }
}
