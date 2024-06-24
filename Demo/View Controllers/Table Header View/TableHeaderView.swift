import UIKit

class TableHeaderView: UIView {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var sectionImageView: UIImageView!
    @IBOutlet weak var matchLabel: UILabel!
    
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

extension TableHeaderView {
    
    //MARK: TableHeader
    
    func configureView() {
        guard let tableHeaderView = Bundle.main.loadNibNamed("TableHeaderView", owner: self)?.first as? UIView else { return }
        tableHeaderView.frame = self.bounds
        self.addSubview(tableHeaderView)
    }
}
