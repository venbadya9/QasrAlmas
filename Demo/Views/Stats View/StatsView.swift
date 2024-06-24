import UIKit

class StatsView: UIView {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var matchBtn: UIButton!
    @IBOutlet weak var set1Btn: UIButton!
    @IBOutlet weak var set2Btn: UIButton!
    @IBOutlet weak var set3Btn: UIButton!
    
    @IBOutlet var btnCollection: [UIButton]!
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
    
    //MARK: IBActions
    
    @IBAction func matchTapped(_ sender: UIButton) {
        setSelected(matchBtn)
    }
    
    @IBAction func set1Tapped(_ sender: UIButton) {
        setSelected(set1Btn)
    }
    
    @IBAction func set2Tapped(_ sender: UIButton) {
        setSelected(set2Btn)
    }
    
    @IBAction func set3Tapped(_ sender: UIButton) {
        setSelected(set3Btn)
    }
}

extension StatsView {
    
    //MARK: Methods
    
    func configureView() {
        guard let statsView = Bundle.main.loadNibNamed("StatsView", owner: self)?.first as? UIView else { return }
        statsView.frame = self.bounds
        self.addSubview(statsView)

        matchTapped(matchBtn)
    }
    
    // Default implementation on view load
    func setSelected(_ button: UIButton) {
        btnCollection.forEach { btn in
            btn.layer.borderWidth = borderWidth
            btn.layer.borderColor = stack?.cgColor
            btn.layer.cornerRadius = cornerRadius10
            btn.isSelected = false
            btn.backgroundColor = .clear
        }
        button.isSelected = true
        button.backgroundColor = shamrock
        stackView.layer.cornerRadius = cornerRadius10
    }
}
