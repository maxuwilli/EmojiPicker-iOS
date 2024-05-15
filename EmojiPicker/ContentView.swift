//
//  ContentView.swift
//  EmojiPicker
//
//  Created by Max Williams on 2024-05-14.
//
//  Created following this tutorial: https://www.youtube.com/watch?v=nqTcAzPS3oc
import SwiftUI

// The enum is basically a list of cases that you can define and pick from.
enum Emoji: String, CaseIterable {
    case 👽, 💩, 🤖, 🤡
}

struct ContentView: View {
    // The State variable selection serves as a reference to an emoji from our enum
    @State var selection: Emoji = .👽
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(selection.rawValue)
                    .font(.system(size: 150))
                    .padding()
                Text(String((UnicodeScalar(selection.rawValue)?.properties.name)!))
                    .padding()
                
                
                
                Picker("Select Emoji:", selection: $selection) {
                    ForEach(Emoji.allCases, id: \.self) { emoji in
                        Text(emoji.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
            }
            .navigationTitle("Emoji Picker")
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}


// NOTE: Alternative way to generate the preview

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
