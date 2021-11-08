//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Damien Chailloleau on 04/11/2021.
//

import SwiftUI

struct FlagImage: View {
    
    var image: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 170)
                .clipShape(Capsule())
        }
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(image: "France")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
