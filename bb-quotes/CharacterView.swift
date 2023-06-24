//
//  CharacterView.swift
//  bb-quotes
//
//  Created by Matt Maher on 6/24/23.
//

import SwiftUI

struct CharacterView: View {
    let show: String
    let character: Character

    var body: some View {
        return GeometryReader { geo in
            ZStack(alignment: .top) {
                // bg image
                Image(show.lowerNoSpaces)
                    .resizable()
                    .scaledToFit()

                ScrollView {
                    // char image
                    VStack {
                        AsyncImage(
                            url: character.images.randomElement())
                        { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    .cornerRadius(25)
                    .frame(width: geo.size.width/1.2, height: geo.size.height/1.7)
                    .padding(.top, 60)

                    // meta
                    VStack(alignment: .leading) {
                        Group {
                            Text("Name")
                                .font(.largeTitle)
                            
                            Text("Portrayed By: " + character.portrayedBy)
                                .font(.subheadline)
                        }
                        
                        Divider()
                        
                        Group {
                            Text("\(character.name) Character Info")
                                .font(.title2)
                            
                            Text("Born: " + character.birthday)
                        }
                        
                        Divider()
                        
                        Group {
                            Text("Occupations:")
                            
                            ForEach(character.occupations, id: \.self) { occupation in
                                Text("• " + occupation)
                                    .font(.subheadline)
                            }
                        }
                        
                        Divider()
                        
                        Group {
                            Text("Nicknames:")
                            
                            if character.aliases.count > 0 {
                                ForEach(character.aliases, id: \.self) { alias in
                                    Text("• " + alias)
                                        .font(.subheadline)
                                }
                            } else {
                                Text("None")
                                    .font(.subheadline)
                            }
                        }
                    }
                    .padding([.leading, .bottom], 40)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(show: Constants.bbName,
                      character: Constants.previewCharacter)
    }
}
