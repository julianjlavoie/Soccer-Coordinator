// Nate Grant: Soccer Coordinator Project - 01

/*
 
 // PART 1: Choose an appropriate data type to store information for each player (Name, Team, Height, and Guardian Name). Then create an empty collection variable to hold all the players’ data.
 
 
 PART 2: Assign all 18 players to teams, experience level on all teams must be the same. Store each teams player in its own new colllection variable.
 
 
 PART 3: Create Logic that generates a letter for all of the players guardians, letting them know which team their child has been placed on and when they should attend their first team team practice.
 
 Data: (player name, team name, guardians’ names, practice date/time)
 
 Practice Times (Dragons - March 17, 1pm, Sharks - March 17, 3pm, Raptors - March 18, 1pm)
 
*/

import Foundation




// PART 1: Choose an appropriate data type to store information for each player (Name, Team, Height, and Guardian Name). Then create an empty collection variable to hold all the players’ data.


// Individual Players Data


let player1 = ["name": "Joe Smith",
               "height": 42,
               "experience": true,
               "guardian": "Jim and Jan Smith"]

let player2 = ["name": "Jill Tanner",
               "height": 36,
               "experience": true,
               "guardian": "Clara Tanner"]

let player3 = ["name": "Bill Bon",
               "height": 43,
               "experience": true,
               "guardian": "Sara and Jenny Bon"]

let player4 = ["name": "Eva Gordon",
               "height": 45,
               "experience": false,
               "guardian": "Wendy and Mike Gordon"]

let player5 = ["name": "Matt Gill",
               "height": 40,
               "experience": false,
               "guardian": "Charles and Sylvia Gill"]

let player6 = ["name": "Kimmy Stein",
               "height": 41,
               "experience": false,
               "guardian": "Bill and Hillary Stein"]

let player7 = ["name": "Sammy Adams",
               "height": 45,
               "experience": false,
               "guardian": "Jeff Adams"]

let player8 = ["name": "Karl Saygan",
               "height": 42,
               "experience": true,
               "guardian": "Heather Bledsoe"]

let player9 = ["name": "Suzane Greenberg",
               "height": 44,
               "experience": true,
               "guardian": "Henrietta Dumas"]

let player10 = ["name": "Sal Dali",
               "height": 41,
               "experience": false,
               "guardian": "Gala Dali"]

let player11 = ["name": "Joe Kavalier",
               "height": 39,
               "experience": false,
               "guardian": "Sam and Elaine Kavalier"]

let player12 = ["name": "Ben Finkelstein",
               "height": 44,
               "experience": false,
               "guardian": "Aaron and Jill Finkelstein"]

let player13 = ["name": "Diego Soto",
               "height": 41,
               "experience": true,
               "guardian": "Robin and Sarika Soto"]

let player14 = ["name": "Chloe Alaska",
               "height": 47,
               "experience": false,
               "guardian": "David and Jamie Alaska"]

let player15 = ["name": "Arnold Willis",
               "height": 43,
               "experience": false,
               "guardian": "Claire Willis"]

let player16 = ["name": "Phillip Helm",
               "height": 44,
               "experience": true,
               "guardian": "Thomas Helm and Eva Jones"]

let player17 = ["name": "Les Clay",
               "height": 42,
               "experience": true,
               "guardian": "Wynonna Brown"]

let player18 = ["name": "Herschel Krustofski",
                "height": 45,
                "experience": true,
                "guardian": "Hyman and Rachel Krustofski"]




// An array to store all of the players. Var because of changeability

var playerArray = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]


// Team Variables. It's a variable if we decide to add more players to the roster

var sharks: [[String:AnyObject]] = []
var dragons: [[String:AnyObject]] = []
var raptors: [[String:AnyObject]] = []


// Team Practice Constants

let sharksFirstGame = "March 17, 3PM"
let dragonsFirstGame = "March 17, 1PM"
let raptorsFirstGame = "March 18, 1PM"

// Experience Variables

var experiencedPlayers: [[String:AnyObject]] = []
var inexperiencedPlayers: [[String:AnyObject]] = []


// Function to count experienced/non-experienced players


func countExperience() {
    
    for player in playerArray {
        
        if player["experience"] == true {
            
            experiencedPlayers.append(player)

            
        } else {
            
            inexperiencedPlayers.append(player)
        }
        
    }
    
}


countExperience()


print(experiencedPlayers)
print(inexperiencedPlayers)

let teams = [sharks, dragons, raptors]

let allExperiencedPlayers = experiencedPlayers.count / teams.count
let allInExperiecedPlayers = inexperiencedPlayers.count / teams.count

let totalPlayersForEachTeam = allInExperiecedPlayers + allExperiencedPlayers

var sharksExpPlayers = 0

var sharksInExpPlayers = 0

var dragonsExpPlayers = 0

var dragonsInExpPlayers = 0

var raptorsExpPlayers = 0

var raptorsInExpPlayers = 0


// PART 2: Assign all 18 players to teams, experience level on all teams must be the same. Store each teams player in its own new colllection variable.


func sortAllPlayers() {
    
    
    for player in playerArray {
        
        if (sharks.count < totalPlayersForEachTeam && sharksExpPlayers < allExperiencedPlayers && player["experience"] ==  true) {
            
            sharksExpPlayers += 1
            
            sharks.append(player)
            
        } else if (sharks.count < totalPlayersForEachTeam && sharksInExpPlayers < allInExperiecedPlayers && player["experience"] == false) {
            
            sharksInExpPlayers += 1
            
            sharks.append(player)
            
        } else if (dragons.count < totalPlayersForEachTeam && dragonsExpPlayers < allExperiencedPlayers && player["experience"] == true) {
            
            dragonsExpPlayers += 1
            
            dragons.append(player)
            
        } else if (dragons.count < totalPlayersForEachTeam && dragonsInExpPlayers < allInExperiecedPlayers && player["experience"] == false) {
            
            dragonsInExpPlayers += 1
            
            dragons.append(player)
            
        } else if (raptors.count < totalPlayersForEachTeam && raptorsExpPlayers < allExperiencedPlayers && player["experience"] == true) {
            
            raptorsExpPlayers += 1
            
            raptors.append(player)
            
        } else if (raptors.count < totalPlayersForEachTeam && raptorsInExpPlayers < allInExperiecedPlayers && player["experience"] == false) {
            
            raptorsInExpPlayers += 1
            
            raptors.append(player)
            
        }
        
    }
    
}



sortAllPlayers()


// Printing each teams String to show players

print("\(sharks)\n")
print("\(dragons)\n")
print("\(raptors)\n")


// PART 3: Create Logic that generates a letter for all of the players guardians, letting them know which team their child has been placed on and when they should attend their first team team practice.


func printPlayerLetters() {
    
    // For Each player in each team, write a letter out to their parents for their first game
    
    
    for individualPlayer in sharks {
        
        print("Hello \(individualPlayer["guardian"]!), your child \(individualPlayer["name"]!) is playing their first game with the Sharks! Join us on \(sharksFirstGame)")
        
    }
    
    for individualPlayer in dragons {
       
        print("Hello \(individualPlayer["guardian"]!), your child \(individualPlayer["name"]!) is playing their first game with the Dragons! Join us on \(dragonsFirstGame)")
        
    }
    
    for individualPlayer in raptors {
       
        print("Hello \(individualPlayer["guardian"]!), your child \(individualPlayer["name"]!) is playing their first game with the Raptors! Join us on \(raptorsFirstGame)")
        
    }
}



printPlayerLetters()


   














