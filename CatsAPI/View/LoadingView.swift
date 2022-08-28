//
//  LoadingView.swift
//  CatsAPI
//
//  Created by Maciej on 27/08/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("😸")
                .font(.system(size: 80))
            ProgressView()
            Text("Loading cats...")
                .foregroundColor(.gray)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
