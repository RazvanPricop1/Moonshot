//
//  MissionView.swift
//  Moonshot
//
//  Created by Razvan Pricop on 22.10.24.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let astronauts: [String: Astronaut]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                
                Text(mission.formattedLaunchDate)
                    .padding(.bottom)
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.lightBackground)
                    .padding(.horizontal)
                
                MissionHighlightsView(mission: mission)
                    .padding(.horizontal)
            
                VStack {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.horizontal)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    CrewCarousel(mission: mission, astronauts: astronauts)
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    MissionView(mission: missions[1], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
