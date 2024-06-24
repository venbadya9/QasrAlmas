import Foundation

class MatchDetailViewModel {
    
    //MARK: Variables
    
    var matchDetail: MatchDetails!
    var service: APIService!
    var matchId: String!
    
    //MARK: Initialization
    
    init(service: APIService, matchId: String) {
        self.service = service
        self.matchId = matchId
    }
    
    //MARK: Methods
    
    //Calling API to fetch match list
    func postRequest(completion: @escaping (MatchDetails?, APIError?) -> Void) {
        guard let url = URL(string: matchDetailEndpoint+"\(matchId ?? "")") else { return }
        let request = URLRequest(url: url)
        
        service.makeRequest(with: request, respModel: MatchDetails.self) { [weak self] data, error in
            DispatchQueue.main.async {
                Loader.shared.hideOverlayView()
            }
            if let error = error {
                DispatchQueue.main.async {
                    completion( nil, error)
                }
            } else {
                if let matchInfo = data {
                    self?.matchDetail = matchInfo
                    completion(self?.matchDetail, nil)
                }
            }
        }
    }
}
