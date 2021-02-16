//
//  Mission.swift
//  Moonshot
//
//  Created by Michał Derej on 15/02/2021.
//

import Foundation

struct Mission: Codable, Identifiable {
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    
    func namesOfCrew(astronauts: [Astronaut], separator: Character = "\n") -> String {
        
        var crewNames = ""
        
        for member in crew {
            if let matching = astronauts.first(where: { $0.id == member.name }) {
                crewNames += matching.name + String(separator)
            } else {
                fatalError("Crew member \(member.name) not found")
            }
        }
        
        return String(crewNames.dropLast())
    }
}
