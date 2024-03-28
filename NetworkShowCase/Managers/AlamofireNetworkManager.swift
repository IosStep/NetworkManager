import Foundation
import Alamofire

class AlamofireNetworkManager {
    
    static let shared = AlamofireNetworkManager()
    
    func getJoke(completion: @escaping (Joke?) -> Void) {
        let url = URL(string: "https://official-joke-api.appspot.com/random_joke")!
        
        AF.request(url).response { response in
            if let data = response.data {
                let decoder = JSONDecoder()
                do {
                    let joke = try decoder.decode(Joke.self, from: data)
                    completion(joke)
                }catch {
                    completion(nil)
                }
            }
        }
    }
    
    func getCharacters(completion: @escaping (SWCharacterResponse?) -> Void) {
        let url = URL(string: "https://swapi.dev/api/people/")!
        
        AF.request(url).response { response in
            
            print(response.response?.statusCode)
            
            if let data = response.data {
                let decoder = JSONDecoder()
                do {
                    let character = try decoder.decode(SWCharacterResponse.self, from: data)
                    completion(character)
                }catch {
                    print(error)
                    completion(nil)
                }
            }
        }
    }
    
    func getStarship(_ completion: @escaping (SWStarshipResponse?) -> Void ) {
        let url = URL(string: "https://swapi.dev/api/starships/")!

        AF.request(url).response { response in
            
            print(response.response?.statusCode)
            
            if let data = response.data {
                let decoder = JSONDecoder()
                do {
                    let starship = try decoder.decode(SWStarshipResponse.self, from: data)
                    completion(starship)
                }catch {
                    print(error)
                    completion(nil)
                }
            }
        }
        
        
    }
    
    
    
    
}

