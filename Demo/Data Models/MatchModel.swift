import Foundation

//MARK: - MatchModel

struct MatchModel: Codable {
    let matchList: [MatchList]
}

//MARK: - MatchList

struct MatchList: Codable {
    let match: [Match]?
    let tournamentName: String?

    enum CodingKeys: String, CodingKey {
        case match
        case tournamentName = "tournament_name"
    }
}

//MARK: - MatchDetailsClass

struct MatchDetailsClass: Codable {
    let homeScores, awayScores: [Int]
    let stats: [[Double]]?
    
    enum CodingKeys: String, CodingKey {
        case homeScores = "home_scores"
        case awayScores = "away_scores"
        case stats = "stats"
    }
}

//MARK: - Match

struct Match: Codable {
    let id: String
    let details: MatchDetails
}

//MARK: - MatchDetails

struct MatchDetails: Codable {
    let matchDetails: MatchDetailsClass
    let awayTeamDetail, homeTeamDetail: TeamDetail
    let tournamentDetails: TournamentDetails

    enum CodingKeys: String, CodingKey {
        case matchDetails = "match_details"
        case awayTeamDetail = "away_team_detail"
        case homeTeamDetail = "home_team_detail"
        case tournamentDetails = "tournament_details"
    }
}

//MARK: - TeamDetail

struct TeamDetail: Codable {
    let name: String
    let logo: String

    enum CodingKeys: String, CodingKey {
        case name
        case logo
    }
}

//MARK: - TournamentDetails

struct TournamentDetails: Codable {
    let name: String
    let logo: String

    enum CodingKeys: String, CodingKey {
        case name
        case logo
    }
}
