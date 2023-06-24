//
//  QuoteView.swift
//  bb-quotes
//
//  Created by Matt Maher on 6/23/23.
//

import SwiftUI

struct QuoteView: View {
    var body: some View {
//        let fetchController = FetchController()
//        let viewModel = ViewModel(controller: fetchController)
//        viewModel.getData(for: "Breaking Bad")

        return GeometryReader { geo in
            ZStack {
                Image("breakingbad")
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                VStack {
                    Spacer(minLength: 140)

                    Text("\"You either run from things, or you run from the, Mr. White.\"")
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding()
                        .background(.black.opacity(0.5))
                        .cornerRadius(10)
                        .padding(.horizontal)

                    ZStackLayout(alignment: .bottom) {
                        Image("jessepinkman")
                            .resizable()
                            .scaledToFill()
                        Text("Jesse Pinkman")
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                    }
                    .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                    .cornerRadius(30)

                    Spacer()

                    Button {} label: {
                        Text("Get Random Quote")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("BreakingBadGreen"))
                            .cornerRadius(7)
                            .shadow(color: Color("BreakingBadYellow"), radius: 5)
                    }

                    Spacer(minLength: 180)
                }
                .frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
            .preferredColorScheme(.dark)
    }
}
