import Foundation


protocol CharactersPresentationLogic {
    func viewDidLoad()
}

class CharactersPresenter {
    var view: CharactersView?
    let manager = AlamofireNetworkManager.shared
    
    private func getCharacters() {
        manager.getCharacters { /*[weak self] */response in
            guard let results = response?.results else {
                self.view?.showError("Error while getting characters")
                return
            }
            
            self.view?.displayCharacters(results)

        }
    }
}

extension CharactersPresenter: CharactersPresentationLogic {
    func viewDidLoad() {
        getCharacters()
    }
    
    
}
