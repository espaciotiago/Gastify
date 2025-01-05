//
//  BigCard.swift
//  Gastify
//
//  Created by Santiago Moreno on 5/01/25.
//

import SwiftUI

struct BigCard: View {

    let topText: String
    let bottomText: String
    let height: CGFloat
    let color: Color

    init(topText: String,
         bottomText: String,
         height: CGFloat = 160,
         color: Color = .primary) {
        self.bottomText = bottomText
        self.topText = topText
        self.height = height
        self.color = color
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(self.color)
            VStack(alignment: .leading) {
                Text(topText)
                    .font(.label(size: .medium, weight: .medium))
                    .foregroundStyle(Color.white)
                Spacer()
                HStack {
                    Spacer()
                    Text(bottomText)
                        .font(.title())
                        .foregroundStyle(Color.white)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .frame(height: height)
    }
}

#Preview {
    BigCard(topText: "Tus ingresos", bottomText: "$ 10M")
        .padding()
}
