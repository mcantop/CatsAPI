//
//  Breed.swift
//  CatsAPI
//
//  Created by Maciej on 27/08/2022.
//

import Foundation

struct Breed: Codable, CustomStringConvertible, Identifiable {
    let id: String
    let name: String
    let temperament: String
    let breedExplanation: String
    let energyLevel: Int
    let isHairless: Bool
    let image: BreedImage?
    
    var description: String {
        return "breed with name: \(name), id: \(id), energy level: \(energyLevel), is hairless: \(isHairless ? "yes" : "no")"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case breedExplanation = "description"
        case energyLevel = "energy_level"
        case isHairless = "hairless"
        case image
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        breedExplanation = try values.decode(String.self, forKey: .breedExplanation)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        
        let hairless = try values.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
        
        image = try values.decodeIfPresent(BreedImage.self, forKey: .image)
    }
    
    init(name: String, id: String, explaination: String, temperament: String, energyLevel: Int, isHairless: Bool, image: BreedImage?) {
        self.name = name
        self.id = id
        self.breedExplanation = explaination
        self.energyLevel = energyLevel
        self.temperament = temperament
        self.image = image
        self.isHairless = isHairless
    }
    
    static func example1() -> Breed {
        return Breed(
            name: "Abyssinian",
            id: "abys",
            explaination: "bla bla bla.bla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla blabla bla bla.",
            temperament: "Active",
            energyLevel: 4,
            isHairless: false,
            image: nil
        )
    }
    
    static func example2() -> Breed {
        return Breed(
            name: "Cyprus",
            id: "cypr",
            explaination: "bla bla bla. bla bla blabla bla blabla bla blabla bla blabla bla bla.bla bla blabla bla blabla bla blabla bla blabla bla bla.",
            temperament: "Social",
            energyLevel: 5,
            isHairless: false,
            image: nil
        )
    }

}
