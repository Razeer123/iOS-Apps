//
//  ContentView.swift
//  Moonshot
//
//  Created by Michał Derej on 15/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showCrew = false
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        if (!self.showCrew) {
                            Text(mission.formattedLaunchDate)
                        } else {
                            Text(mission.namesOfCrew(astronauts: self.astronauts))
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showCrew.toggle()
                                    }, label: {
                                        Text("Show \(self.showCrew ? "date" : "crew")")
                                    })
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
