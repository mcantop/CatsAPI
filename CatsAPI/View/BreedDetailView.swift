//
//  BreedDetailView.swift
//  CatsAPI
//
//  Created by Maciej on 28/08/2022.
//

import SwiftUI

struct BreedDetailView: View {
    let breed: Breed
    let imageSize: CGFloat = 300
    
    var body: some View {
        VStack {
            if breed.image != nil {
                AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFit()
                            .frame(height: imageSize)
                            .clipped()
                    } else if phase.error != nil {
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(.pink)
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
            } else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading, spacing: 15) {
                Text(breed.name)
                    .font(.headline)
                Text(breed.temperament)
                    .font(.footnote)
                Text(breed.breedExplanation)
                if breed.isHairless {
                    Text("Hairless")
                }
                
                HStack {
                    Text("Energy level")
                    Spacer()
                    ForEach(1..<6) { id in
                        Image(systemName: "star.fill")
                            .foregroundColor(breed.energyLevel > id ? Color.accentColor : Color.gray)
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetailView(breed: Breed.example1())
    }
}
