//
//  ContentView.swift
//  Moonshot
//
//  Created by Razvan Pricop on 21.10.24.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var viewPreference = false
    
    var body: some View {
        NavigationStack {
            Group {
                if viewPreference {
                    GridView(astronauts: astronauts, missions: missions)
                } else {
                    ListView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button("List") {
                    viewPreference = true
                }
                Button("Grid") {
                    viewPreference = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
