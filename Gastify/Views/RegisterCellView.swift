//
//  RegisterCellView.swift
//  Gastify
//
//  Created by Santiago Moreno on 5/01/25.
//

import SwiftUI

struct RegisterCellView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .center, spacing: 8) {
                ZStack {
                    Circle().fill(Color.primary)
                    IconImage(.arrowUp, color: Color.white)
                }
                .frame(width: 32, height: 32)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Primera quincena de enero")
                        .font(.label(weight: .medium))
                        .foregroundStyle(Color.dark)
                    Text("01/01/2025")
                        .font(.label(size: .small))
                        .foregroundStyle(Color.tertiary)
                }
                Spacer()
                Text("$ 10M")
                    .font(.title(size: .medium))
                    .foregroundStyle(Color.dark)
            }.padding(.horizontal)
            Divider()
        }
    }
}

#Preview {
    RegisterCellView()
}
