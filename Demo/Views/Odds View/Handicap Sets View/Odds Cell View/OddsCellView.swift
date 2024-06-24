import UIKit

class OddsCellView: UIView {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var p1Label1: UILabel!
    @IBOutlet weak var p1Label2: UILabel!
    @IBOutlet weak var p1Label3: UILabel!
    @IBOutlet weak var p1Label4: UILabel!
    
    @IBOutlet weak var p2Label1: UILabel!
    @IBOutlet weak var p2Label2: UILabel!
    @IBOutlet weak var p2Label3: UILabel!
    @IBOutlet weak var p2Label4: UILabel!
    
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

extension OddsCellView {
    
    //MARK: Methods
    
    func configureView() {
        guard let oddsCellView = Bundle.main.loadNibNamed("OddsCellView", owner: self)?.first as? UIView else { return }
        oddsCellView.frame = self.bounds
        self.addSubview(oddsCellView)
    }
}
