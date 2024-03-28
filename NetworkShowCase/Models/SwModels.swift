import Foundation

struct SWCharacterResponse: Codable {
    var results: [MovieCharacter]
}

struct MovieCharacter: Codable {
    var name: String
    var gender: String
    var birth_year: String
    var starships: [String]
}


struct SWStarshipResponse: Codable {
    var results: [Starship]
}

struct Starship: Codable {
    var name: String
    var model: String
    var max_atmosphering_speed: String
}
