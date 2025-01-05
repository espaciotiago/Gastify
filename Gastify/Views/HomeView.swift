//
//  HomeView.swift
//  Gastify
//
//  Created by Santiago Moreno on 5/01/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ZStack {
                    Color.white.ignoresSafeArea(.all)
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            Header
                            Filters
                            SummaryCards(cardHeight: proxy.size.width/2)
                            Activities
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var Header: some View {
        VStack(alignment: .leading, spacing: 16)  {
            HStack(alignment: .center) {
                Text("Gastify")
                    .font(.title())
                    .foregroundStyle(Color.dark)
                Spacer()
                Button(action: {
                    // TODO: Handle
                }) {
                    IconImage(.plus)
                }
            }
            VStack(alignment: .leading, spacing: 0)  {
                Text("Bienvenido de nuevo.")
                    .font(.label())
                    .foregroundStyle(Color.dark)
                Text("Estas son tus finanzas de hoy")
                    .font(.label())
                    .foregroundStyle(Color.dark)
            }
        }.padding(.horizontal)
    }

    @ViewBuilder
    private var Filters: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 8)  {
                IconImage(.filter)
                Pill(label: "Hoy") {
                    // TODO: Handle
                }
                Pill(label: "Esta semana", status: .unselected) {
                    // TODO: Handle
                }
                Pill(label: "Este mes", status: .unselected) {
                    // TODO: Handle
                }
                Pill(label: "Este año", status: .unselected) {
                    // TODO: Handle
                }
            }.padding(.horizontal)
        }
    }

    @ViewBuilder
    private func SummaryCards(cardHeight: CGFloat) -> some View {
        HStack(alignment: .top, spacing: 8) {
            BigCard(topText: "Tus ingresos",
                    bottomText: "$ 10M",
                    height: cardHeight)

            BigCard(topText: "Tus gastos",
                    bottomText: "$ 10M",
                    height: cardHeight,
                    color: .secondary)
        }.padding(.horizontal)
    }

    @ViewBuilder
    private var Activities: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Tus actividades")
                .font(.title(size: .large))
                .foregroundStyle(Color.dark)
                .padding(.horizontal)
            LazyVStack(alignment: .leading, spacing: 16) {
                RegisterCellView()
                RegisterCellView()
                RegisterCellView()
            }
        }
    }
}

#Preview {
    HomeView()
}
