import UIKit

class MatchCell: UITableViewCell {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var team1ImageView: UIImageView!
    @IBOutlet weak var team1NameLabel: UILabel!
    @IBOutlet weak var team1WinLossView: UIView!
    @IBOutlet weak var team1Set1: UILabel!
    @IBOutlet weak var team1Set2: UILabel!
    @IBOutlet weak var team1Set3: UILabel!
    @IBOutlet weak var team1Set4: UILabel!
    @IBOutlet weak var team1Set5: UILabel!
    
    @IBOutlet weak var team2ImageView: UIImageView!
    @IBOutlet weak var team2NameLabel: UILabel!
    @IBOutlet weak var team2WinLossView: UIView!
    @IBOutlet weak var team2Set1: UILabel!
    @IBOutlet weak var team2Set2: UILabel!
    @IBOutlet weak var team2Set3: UILabel!
    @IBOutlet weak var team2Set4: UILabel!
    @IBOutlet weak var team2Set5: UILabel!
    
    //MARK: Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        team1WinLossView.layer.cornerRadius = cornerRadius15
        team2WinLossView.layer.cornerRadius = cornerRadius15
    }
}
