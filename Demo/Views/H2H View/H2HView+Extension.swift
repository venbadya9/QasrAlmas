import Foundation
import UIKit

extension H2HView {
    
    //MARK: Methods
    
    func configureView() {
        guard let h2hView = Bundle.main.loadNibNamed("H2HView", owner: self)?.first as? UIView else { return }
        h2hView.frame = self.bounds
        self.addSubview(h2hView)

        moreButton.layer.cornerRadius = cornerRadius10
        moreButton.layer.borderColor = pumice?.cgColor
        moreButton.layer.borderWidth = borderWidth
        statsView.layer.cornerRadius = cornerRadius10
        stackView.layer.cornerRadius = cornerRadius10
        
        head2headTapped(head2headBtn)
    }
    
    // Default Implementation on load of view
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
    
    // Resetting views based on segment selection
    func resetStats(isPlayer: Bool = false) {
        p1Label.text = isPlayer ? "Player 1" : "Won"
        p1gamesWonLabel.text = isPlayer ? "7 wins" : "4"
        [p1Label, p1gamesWonLabel].forEach { statsLabel in
            statsLabel?.textColor = isPlayer ? springRain : shamrock
        }
        p2Label.text = isPlayer ? "Player 2" : "Lost"
        p2gamesWonLabel.text = isPlayer ? "5 wins" : "8"
        [p2Label, p2gamesWonLabel].forEach { statsLabel in
            statsLabel?.textColor = isPlayer ? aquaIsland : cornflowerLilac
        }
        statusImageView.image = isPlayer ? UIImage(named: "PlayerStats") : UIImage(named: "Stats")
    }
    
    func configureUIComponents() {
        // Dummy Data
        let eventArray = ["S2", "S1", "S3", "S3", "S3" ,"S3"]
        
        eventArray.forEach { event in
            let playerView = PlayerView()
            playerView.eventNameLabel.text = event
            playerView.eventNameLabel.textColor = shamrock
            stackView.addArrangedSubview(playerView)
        }
    }
}
