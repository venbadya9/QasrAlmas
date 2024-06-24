import Foundation
import UIKit
import SDWebImage

extension MatchDetailVC {

    //MARK: Methods
    
    func configureUIComponents() {
        headerView?.delegate = self
        segmentView = OverviewView(frame: CGRect(
            x: 0,
            y: 0,
            width: self.view.frame.width,
            height: self.view.frame.height - headerView.frame.height + safeAreaHeight)
        )
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.reloadData()
    }
    
    func updateUI() {
        headerView.leagueName.text = matchDetailViewModel.matchDetail.tournamentDetails.name
        
        let homeTeamImageUrl = URL(string: matchDetailViewModel.matchDetail.homeTeamDetail.logo)
        headerView.homeTeamLogo.sd_setImage(with: homeTeamImageUrl)
        headerView.homeTeamName.text = matchDetailViewModel.matchDetail.homeTeamDetail.name
        
        let awayTeamImageUrl = URL(string: matchDetailViewModel.matchDetail.awayTeamDetail.logo)
        headerView.awayTeamLogo.sd_setImage(with: awayTeamImageUrl)
        headerView.awayTeamName.text = matchDetailViewModel.matchDetail.awayTeamDetail.name
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a E, d MMM, yyyy"
        let convertedDate: String = dateFormatter.string(from: currentDate)
        headerView.currentDate.text = convertedDate
        
        let homeTeamScore = matchDetailViewModel.matchDetail.matchDetails.homeScores.first
        let awayTeamScore = matchDetailViewModel.matchDetail.matchDetails.awayScores.first
        headerView.currentScore.text = "\(homeTeamScore ?? 0) : \(awayTeamScore ?? 0)"
    }
    
    //Adding stats view after load of main view
    func addStats() {
        if let stats = matchDetailViewModel.matchDetail.matchDetails.stats, stats.count > 0 {
            stats.forEach({ statsArray in
                let specificationView = SpecificationView()
                
                switch statsArray.first {
                case 1: specificationView.descriptionLabel.text = "3-point goals"
                case 2: specificationView.descriptionLabel.text = "2-point goals"
                case 3: specificationView.descriptionLabel.text = "Free throw goals"
                case 4: specificationView.descriptionLabel.text = "Number of pauses remaining"
                case 5: specificationView.descriptionLabel.text = "Fouls"
                case 6: specificationView.descriptionLabel.text = "Free throw percentage"
                case 7: specificationView.descriptionLabel.text = "Total pauses"
                default: specificationView.descriptionLabel.text = ""
                }
                
                specificationView.homeLabel.text = "\(statsArray[1])"
                specificationView.awayLabel.text = "\(statsArray[2])"
                if statsArray[1] > statsArray[2] {
                    specificationView.homeView.backgroundColor = pastelGreen
                } else if statsArray[1] < statsArray[2] {
                    specificationView.awayView.backgroundColor = pastelGreen
                }
                statsView.stackView.addArrangedSubview(specificationView)
            })
        } else {
            showAlertMessage(title: "Alert", message: "No stats received.")
        }
    }
}

//MARK: Protocol Functions

extension MatchDetailVC: HandleSegemnts {
    func handleSegmentNavigation(_ view: UIView) {
        segmentView?.subviews.forEach( { $0.removeFromSuperview()})
        segmentView = view
        if view.isKind(of: StatsView.self) {
            statsView = view as? StatsView
            addStats()
        }
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
    }
    
    func handleBack() {
        self.navigationController?.popViewController(animated: false)
    }
}

//MARK: TableViewDelegate, TableViewDataSource

extension MatchDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentCell", for: indexPath)
        cell.contentView.addSubview(segmentView ?? UIView())
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return segmentView?.frame.height ?? 0.0
    }
}

