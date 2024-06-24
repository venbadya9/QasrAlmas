import Foundation
import UIKit
import SDWebImage

extension MatchVC {
    
    //MARK: Methods
    
    func configureUIComponents() {
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.separatorStyle = .none
        let nib = UINib(nibName: "MatchCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MatchCell")
    }
}

//MARK: TableViewDelegate, TableViewDataSource

extension MatchVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return matchViewModel.matchList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let matchCount = matchViewModel.matchList[section].match?.count {
            return matchCount
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as? MatchCell
        else { return UITableViewCell() }
        if let match = matchViewModel.matchList[indexPath.section].match?[indexPath.row] {
            
            let awayTeamImageUrl = URL(string: match.details.awayTeamDetail.logo)
            cell.team1ImageView.sd_setImage(with: awayTeamImageUrl)
            cell.team1NameLabel.text = match.details.awayTeamDetail.name
            
            let homeTeamImageUrl = URL(string: match.details.homeTeamDetail.logo)
            cell.team2ImageView.sd_setImage(with: homeTeamImageUrl)
            cell.team2NameLabel.text = match.details.homeTeamDetail.name
            
            let awayScore = match.details.matchDetails.awayScores
            let homeScore = match.details.matchDetails.homeScores
                        
            if awayScore.count > 4 && homeScore.count > 4 {
                cell.team1Set1.text = "\(awayScore[0])"
                cell.team1Set2.text = "\(awayScore[1])"
                cell.team1Set3.text = "\(awayScore[2])"
                cell.team1Set4.text = "\(awayScore[3])"
                cell.team1Set5.text = "\(awayScore[4])"
                
                cell.team2Set1.text = "\(homeScore[0])"
                cell.team2Set2.text = "\(homeScore[1])"
                cell.team2Set3.text = "\(homeScore[2])"
                cell.team2Set4.text = "\(homeScore[3])"
                cell.team2Set5.text = "\(homeScore[4])"
                
                if awayScore[0] > homeScore[0] {
                    cell.team1WinLossView.backgroundColor = pastelGreen
                    cell.team2WinLossView.backgroundColor = faluRed
                } else if awayScore[0] < homeScore[0] {
                    cell.team1WinLossView.backgroundColor = faluRed
                    cell.team2WinLossView.backgroundColor = pastelGreen
                } else {
                    cell.team1WinLossView.backgroundColor = pastelGreen
                    cell.team2WinLossView.backgroundColor = pastelGreen
                }
            }
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TableHeaderView(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: tableHeaderHeight))
        if let match = matchViewModel.matchList[section].match,
           match.count > 0,
           let tournament = matchViewModel.matchList[section].tournamentName,
           let imageUrl = URL(string: match.first!.details.tournamentDetails.logo) {
            header.sectionImageView.sd_setImage(with: imageUrl)
            header.matchLabel.text = tournament
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let match = matchViewModel.matchList[indexPath.section].match?[indexPath.row] {
            let matchId = match.id
            if let matchDetailVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MatchDetailVC") as? MatchDetailVC {
                matchDetailVC.matchId = matchId
                self.navigationController?.pushViewController(matchDetailVC, animated: true)
            }
        }
    }
}
