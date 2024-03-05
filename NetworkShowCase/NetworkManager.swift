import UIKit

class NetworkManager {
   
    static let shared = NetworkManager()
    
    func getJoke(completion: @escaping (Joke?) -> Void) {
        let url = URL(string: "https://official-joke-api.appspot.com/random_joke")!
        
        let manager = URLSession.shared
        
//        DispatchQueue.main.async {
        
            manager.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print(error)
                    completion(nil)
                    return
                }
                guard let data = data else {
                    completion(nil)
                    return
                }
                
                let decoder = JSONDecoder()
                do {
                    let joke = try decoder.decode(Joke.self, from: data)
                    completion(joke)
//                    print(data)
                } catch {
                    print("error")
                    completion(nil)
                    return
                }
                
            }.resume()
    }
    
}


struct Joke: Codable {
    var type: String
    var setup: String
    var punchline: String
    var id: Int
}
