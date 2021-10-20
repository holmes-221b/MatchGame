//
//  ContentView.swift
//  MatchGame
//
//  Created by Phanindra Saggurthi on 20/10/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️","🚀","🚁","🏍","🚂","🚈", "🛺","🚙","🛶"]
    let emojiCount = 4
    var body: some View {
        
        HStack {
            ForEach(emojis[0..<emojiCount], id:\.self , content: {
                emoji in
                CardView(content: emoji)
            })
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView()
            .preferredColorScheme(.light)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
                    .foregroundColor(.red)
            }
        }
        .onTapGesture {
            self.isFaceUp = !isFaceUp
        }
    }
}
