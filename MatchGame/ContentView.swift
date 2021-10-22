//
//  ContentView.swift
//  MatchGame
//
//  Created by Phanindra Saggurthi on 20/10/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️","🚀","🚁","🏍","🚂","🚈", "🛺","🚙","🛶","🚠"]
    @State var emojiCount = 10
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 25))]) {
                    ForEach(emojis[0..<emojiCount], id:\.self , content: {
                        emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3,contentMode: .fit)
                    })
                }
            }.foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var remove : some View {
        Button(action:{
            if emojiCount >= 1 {
                emojiCount -= 1
            }
        }, label: {
            VStack {
                Image(systemName: "minus.circle")
                
            }
        })
    }
    
    var add : some View {
        Button(action:{
            if (emojiCount < emojis.count) {
               emojiCount += 1
            }
        }, label: {
            VStack {
                Image(systemName: "plus.circle")
                
            }
        })
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
                    .strokeBorder(lineWidth: 3)
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
