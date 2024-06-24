import UIKit

class HandicapSetsView: UIView {
    
    //MARK: IBOutelts
    
    @IBOutlet weak var stackView: UIStackView!
    
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

extension HandicapSetsView {
    
    //MARK: Methods
    
    func configureView() {
        guard let handicapSetsView = Bundle.main.loadNibNamed("HandicapSetsView", owner: self)?.first as? UIView else { return }
        handicapSetsView.frame = self.bounds
        self.addSubview(handicapSetsView)
        
        configureUIComponents()
    }
    
    func configureUIComponents() {
        // Dummy Data
        let cellArray = [("4:15 PM Thursday, January 11, 2024", "+1.5", "2.25", "-1.5"),
                         ("4:30 PM Thursday, January 11, 2024", "+1.5", "2.25", "-1.5"),
                         ("4:45 PM Thursday, January 11, 2024", "+1.5", "2.25", "-1.5"),
                         ("5:00 PM Thursday, January 11, 2024", "+1.5", "2.25", "-1.5")]
        
        cellArray.forEach { (time, val1, val2, val3) in
            let oddsCellView = OddsCellView()
            oddsCellView.timeLabel.text = time
            
            oddsCellView.p1Label1.text = val1
            oddsCellView.p1Label2.text = val1
            
            oddsCellView.p2Label1.text = val3
            oddsCellView.p2Label2.text = val3
            
            oddsCellView.p1Label3.text = val2
            oddsCellView.p1Label4.text = val2
            oddsCellView.p2Label3.text = val2
            oddsCellView.p2Label4.text = val2
            
            stackView.addArrangedSubview(oddsCellView)
        }
    }
}
