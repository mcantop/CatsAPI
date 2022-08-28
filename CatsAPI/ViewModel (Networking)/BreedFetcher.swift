//
//  BreedFetcher.swift
//  CatsAPI
//
//  Created by Maciej on 27/08/2022.
//

import Foundation

class BreedFetcher: ObservableObject {
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        fetchAllBreeds()
    }
    
    func fetchAllBreeds() {
        isLoading = true
        errorMessage = nil
        
        let service = APIService()
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        
        service.fetchBreeds(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
            }
            switch result {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                print(error)
            case .success(let breeds):
                DispatchQueue.main.async {
                    self.breeds = breeds
                }
            }
        }
    }
    
    // MARK: Preview helpers.
    
    static func errorState() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.breeds = [Breed.example1(), Breed.example2()]
        
        return fetcher
    }
}
