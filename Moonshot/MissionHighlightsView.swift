//
//  MissionHighlightsView.swift
//  Moonshot
//
//  Created by Razvan Pricop on 22.10.24.
//

import SwiftUI

struct MissionHighlightsView: View {
    let mission: Mission
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Mission Highlights")
                .font(.title.bold())
                .padding(.bottom, 5)
            
            Divider()
            
            Text(mission.description)
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    MissionHighlightsView(mission: missions[1])
        .preferredColorScheme(.dark)
}
