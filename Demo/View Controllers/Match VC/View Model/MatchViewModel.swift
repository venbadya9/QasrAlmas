import Foundation

class MatchViewModel {
    
    //MARK: Variables
    
    var matchList = [MatchList]()
    var service: APIService!
    
    //MARK: Initialization
    
    init(service: APIService) {
        self.service = service
    }
    
    //MARK: Methods
    
    //Calling API to fetch match detail
    func postRequest(completion: @escaping ([MatchList]?, APIError?) -> Void) {
        guard let url = URL(string: matchEndpoint) else { return }
        let request = URLRequest(url: url)
        
        service.makeRequest(with: request, respModel: MatchModel.self) { [weak self] data, error in
            DispatchQueue.main.async {
                Loader.shared.hideOverlayView()
            }
            if let error = error {
                DispatchQueue.main.async {
                    completion( nil, error)
                }
            } else {
                if let matchInfo = data {
                    self?.matchList = matchInfo.matchList.filter({ $0.tournamentName != nil })
                    completion(self?.matchList, nil)
                }
            }
        }
    }
}
