import UIKit

class ToWinView: UIView {
    
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

extension ToWinView {
    
    //MARK: Methods
    
    func configureView() {
        guard let toWinView = Bundle.main.loadNibNamed("ToWinView", owner: self)?.first as? UIView else { return }
        toWinView.frame = self.bounds
        self.addSubview(toWinView)
    }
}
