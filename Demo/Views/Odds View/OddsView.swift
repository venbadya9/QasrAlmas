import UIKit

class OddsView: UIView {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var toWinBtn: UIButton!
    @IBOutlet weak var handicapSetsBtn: UIButton!
    @IBOutlet weak var totalPointsBtn: UIButton!
    
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
    
    @IBAction func toWinTapped(_ sender: UIButton) {
        setSelected(toWinBtn)
        let toWinView = ToWinView()
        stackView.addArrangedSubview(toWinView)
    }
    
    @IBAction func handicapSetsTapped(_ sender: UIButton) {
        setSelected(handicapSetsBtn)
        let handicapSetsView = HandicapSetsView()
        stackView.addArrangedSubview(handicapSetsView)
    }
    
    @IBAction func totalPointsTapped(_ sender: UIButton) {
        setSelected(totalPointsBtn)
        let totalPointsView = TotalPointsView()
        stackView.addArrangedSubview(totalPointsView)
    }
}

extension OddsView {
    
    //MARK: Methods
    
    func configureView() {
        guard let oddsView = Bundle.main.loadNibNamed("OddsView", owner: self)?.first as? UIView else { return }
        oddsView.frame = self.bounds
        self.addSubview(oddsView)

        toWinTapped(toWinBtn)
    }
    
    // Default implementation upon view load
    func setSelected(_ button: UIButton) {
        stackView?.arrangedSubviews.forEach( { $0.removeFromSuperview()})
        btnCollection.forEach { btn in
            btn.layer.borderWidth = borderWidth
            btn.layer.borderColor = stack?.cgColor
            btn.layer.cornerRadius = cornerRadius10
            btn.isSelected = false
            btn.backgroundColor = .clear
        }
        button.isSelected = true
        button.backgroundColor = shamrock
    }
}
