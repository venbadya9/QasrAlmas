import UIKit

class H2HView: UIView {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var head2headBtn: UIButton!
    @IBOutlet weak var player1Btn: UIButton!
    @IBOutlet weak var player2Btn: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    
    @IBOutlet weak var statsView: UIView!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var p1Label: UILabel!
    @IBOutlet weak var p2Label: UILabel!
    @IBOutlet weak var p1gamesWonLabel: UILabel!
    @IBOutlet weak var p2gamesWonLabel: UILabel!
    @IBOutlet weak var totalMathesLabel: UILabel!
    
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
    
    @IBAction func head2headTapped(_ sender: UIButton) {
        setSelected(head2headBtn)
        resetStats(isPlayer: false)
        configureUIComponents()
    }
    
    @IBAction func player1Tapped(_ sender: UIButton) {
        setSelected(player1Btn)
        resetStats(isPlayer: true)
        configureUIComponents()
    }
    
    @IBAction func player2Tapped(_ sender: UIButton) {
        setSelected(player2Btn)
        resetStats(isPlayer: true)
        configureUIComponents()
    }
}
