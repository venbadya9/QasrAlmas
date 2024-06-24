import Foundation

enum APIError: String {
    case urlSessionError = "Url not valid."
    case invalidResponse = "Invalid response from server."
    case decodingError = "Error parsing server response."
}

protocol Service {
    func makeRequest<T: Codable>(with request: URLRequest, respModel: T.Type, completion: @escaping (T?, APIError?) -> Void)
}

class APIService: Service {
    
    func makeRequest<T: Codable>(with request: URLRequest,
                                 respModel: T.Type,
                                 completion: @escaping (T?, APIError?) -> Void) {
        
        URLSession.shared.dataTask(with: request) { data, resp, error in
            if let _ = error {
                completion(nil, .urlSessionError)
                return
            }
            
            if let resp = resp as? HTTPURLResponse, resp.statusCode != 200 {
                completion(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                completion(nil, .invalidResponse)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result, nil)
                
            } catch {
                completion(nil, .decodingError)
                return
            }
            
        }.resume()
    }
}
