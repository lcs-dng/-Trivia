//
//  Player.swift
//  英超Trivia
//
//  Created by Dexter Ng on 2025-04-03.
//

import Foundation

struct Player: Identifiable {
    
    let id = UUID()
    let playerName: String
    let currentClub: String
    let position: String
    let nationality: String
    let imageName: String
    
}

// Array that stores all players that can be guessed
let playerToGuess = [
    
    Player(
        playerName: "Erling Haaland",
        currentClub: "Manchester City",
        position: "ST",
        nationality: "Norwegian",
        imageName: "erling-haaland"
    ),
    
    Player(
        playerName: "Kevin De Bruyne",
        currentClub: "Manchester City",
        position: "CM",
        nationality: "Belgian",
        imageName: "kevin-de-bruyne"
    ),
    
    Player(
        playerName: "Mohamed Salah",
        currentClub: "Liverpool",
        position: "RW",
        nationality: "Egyptian",
        imageName: "mohamed-salah"
    ),
    
    Player(
        playerName: "Ruben Dias",
        currentClub: "Manchester City",
        position: "CB",
        nationality: "Portuguese",
        imageName: "ruben-dias"
    ),
    
    Player(
        playerName: "Rodri",
        currentClub: "Manchester City",
        position: "CDM",
        nationality: "Spanish",
        imageName: "rodri"
    ),
    
    Player(
        playerName: "Virgil van Dijk",
        currentClub: "Liverpool",
        position: "CB",
        nationality: "Dutch",
        imageName: "virgil-van-dijk"
    ),
    
    Player(
        playerName: "Alisson Becker",
        currentClub: "Liverpool",
        position: "GK",
        nationality: "Brazilian",
        imageName: "alisson-becker"
    ),
    
    Player(
        playerName: "Casemiro",
        currentClub: "Manchester United",
        position: "CDM",
        nationality: "Brazilian",
        imageName: "casemiro"
    ),
    
    Player(
        playerName: "Bruno Fernandes",
        currentClub: "Manchester United",
        position: "CAM",
        nationality: "Portuguese",
        imageName: "bruno-fernandes"
    ),
    
    Player(
        playerName: "Heung Min Son",
        currentClub: "Spurs",
        position: "LW",
        nationality: "Korean",
        imageName: "heung-min-son"
    )
    
]
