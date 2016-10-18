//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

//Grig location structure with coordinates
struct GridLocation {
    let x: Int
    let y: Int
}

//Ship structrue with a struct property
struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}
//protocol Structure also with a struct property
struct Mine: _Mine_ {
    var location: GridLocation
    var explosionText: String
    
}
class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        //creating ships using default constructors/initializers
        let mediumShip1 = Ship(length: 3, location: GridLocation(x:0, y:0),
                               isVertical: false)
        
        let smallShip =  Ship(length: 2, location: GridLocation(x: 1,y: 2), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x:4,y: 5 ), isVertical: false)
        let largeShip = Ship (length: 4, location: GridLocation(x:4,y: 6), isVertical: false)
        let extraLargeShip = Ship(length: 5, location: GridLocation(x:2 , y: 3), isVertical: false)
        
        //adding ships to grid
        human.addShipToGrid(largeShip)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(smallShip)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(extraLargeShip)
        
        //creating mine locations
        let mineLocation1 =  GridLocation (x: 6 , y: 2)
        let mineLocation2 =  GridLocation (x:  4, y: 4)
        
        //creating mines
        let mine1 = Mine(location: mineLocation1,explosionText: "explosion One")
        let mine2 = Mine(location: mineLocation2,explosionText: "explosion Two")
        
        //adding mines to grid
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
    }
    
    //score related
    //this function returns an integer value
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        let initialShipCount = 5
        let enemyShipsSunk = initialShipCount - gameStats.enemyShipsRemaining
        let humanShipsRemaining = initialShipCount - gameStats.humanShipsSunk
        var finalScore: Int
        
        //how many missed and how many hit
        let guessNum = gameStats.numberOfMissesByHuman + gameStats.numberOfHitsOnEnemy
        
        //calculating the final score
        finalScore = (enemyShipsSunk * gameStats.sinkBonus) + (humanShipsRemaining * gameStats.shipBonus) - (guessNum * gameStats.guessPenalty)
        
        return finalScore
    }
}