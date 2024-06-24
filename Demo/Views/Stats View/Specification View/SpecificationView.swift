import UIKit

class SpecificationView: UIView {

    //MARK: IBOutlets
    
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var awayView: UIView!
    @IBOutlet weak var awayLabel: UILabel!
    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureUIComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
        configureUIComponents()
    }
}

extension SpecificationView {
    
    //MARK: Methods
    
    func configureView() {
        guard let specificationView = Bundle.main.loadNibNamed("SpecificationView", owner: self)?.first as? UIView else { return }
        specificationView.frame = self.bounds
        self.addSubview(specificationView)
    }
    
    func configureUIComponents() {
        homeView.layer.cornerRadius = cornerRadius10
        awayView.layer.cornerRadius = cornerRadius10
    }
}
