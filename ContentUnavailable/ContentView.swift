//
//  ContentView.swift
//  ContentUnavailable
//
//  Created by leoncio junior on 02/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var heroes = ["Batman", "Superman", "Flash", "Naruto", "Helsing", "Super Chock"]
    @State private var searchTerm = ""
    
    var filterHeroes: [String] {
        guard !searchTerm.isEmpty else {  return heroes }
        return heroes.filter { $0.localizedCaseInsensitiveContains(searchTerm)}
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(filterHeroes, id: \.self) { hero in
                        Text(hero)
                }
                .searchable(text: $searchTerm)
                .overlay {
                    if filterHeroes.isEmpty {
                        ContentUnavailableView.search
                    }
                }
            }
            .navigationTitle("Heroes")
        }
    
    }
}

#Preview {
    ContentView()
}
