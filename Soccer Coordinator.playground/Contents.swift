import Foundation
// Player constants with dictionary of player info
    let joeSmith = ["name": "Joe Smith", "height": 42, "exp": true, "gaurdians": "Jim & Jan Smith"]
    let jillTanner = ["name": "Jill Tanner", "height": 36, "exp": true, "gaurdians": "Clara Tanner"]
    let billBon = ["name": "Bill Bon", "height": 43, "exp": true, "gaurdians": "Sara & Jenny Bon"]
    let evaGordon = ["name": "Eva Gordon", "height": 45, "exp": false, "gaurdians": "Wendy & Mike Gordon"]
    let mattGill = ["name": "Matt Gill", "height": 40, "exp": false, "gaurdians": "Charles & Silvia Gill"]
    let kimmyStein = ["name": "Kimmy Stein", "height": 41, "exp": false, "gaurdians": "Bill & Hillary Stein"]
    let sammyAdams = ["name": "Sammy Adams", "height": 45, "exp": false, "gaurdians": "Jeff Adams"]
    let karlSagan = ["name": "Karl Sagan", "height": 42, "exp": true, "gaurdians": "Heather Bledsoe"]
    let suzaneGreenberg = ["name": "Suzane Greenberg", "height": 44, "exp": true, "gaurdians": "Henrietta Dumas"]
    let salDali = ["name": "Sal Dali", "height": 41, "exp": false, "gaurdians": "Gala Dali"]
    let joeKavalier = ["name": "Joe Kavalier", "height": 39, "exp": false, "gaurdians": "Sam & Elaine Kavalier"]
    let benFinkelstein = ["name": "Ben Finkelstein", "height": 44, "exp": false, "gaurdians": "Aaron & Jill Finkelstein"]
    let diegoSoto = ["name": "Diego Soto", "height": 41, "exp": true, "gaurdians": "Robin & Sarika Soto"]
    let chloeAlaska = ["name": "Chloe Alaska", "height": 47, "exp": false, "gaurdians": "David & Jamie Alaska"]
    let arnoldWillis = ["name": "Arnold Willis", "height": 43, "exp": false, "gaurdians": "Claire Willis"]
    let phillipHelm = ["name": "Phillip Helm", "height": 44, "exp": true, "gaurdians": "Thomas Helm & Eva Jones"]
    let lesClay = ["name": "Les Clay", "height": 42, "exp": true, "gaurdians": "Wynonna Brown"]
    let herchelKrustofski = ["name": "Herschel Krustofski", "height": 45, "exp": true, "gaurdians": "Hyman & Rachel Krustofski"]

//Array of Players
var prelimanary = [joeSmith,jillTanner,billBon,evaGordon,mattGill,kimmyStein,sammyAdams,karlSagan,suzaneGreenberg,salDali,joeKavalier,benFinkelstein,diegoSoto,chloeAlaska,arnoldWillis,phillipHelm,lesClay,herchelKrustofski,]


//Variables for each team and an array of all teams
var sharks = [NSArray]()
var raptors = [NSArray]()
var dragons = [NSArray]()
var teams = [sharks,raptors,dragons]

 
//Find max Players/Team
func countPTeam() -> Int {
    let count = prelimanary.count / teams.count
    return count
}

//Find max Experienced Players/Team
func expPlayersCount() -> Int {
    var countAs = 0
    for player in prelimanary {
        if player["exp"] as! Bool! == true  {
          countAs += 1
        }
    }
    let expPerTeam = countAs / teams.count
    return expPerTeam
}
//Find max non Expierenced Players/Team
func notExpCount() -> Int {
    var countAs = 0
    for player in prelimanary {
        if player["exp"] as! Bool! == false  {
            countAs += 1
        }
    }
    let nonExpPerTeam = countAs / teams.count
    return nonExpPerTeam
}



//Number of Experienced/Not Experienced Players 'Added' to each team
var sharksExp = 0
var raptorsExp = 0
var dragonsExp = 0
var sharksNexp = 0
var raptorsNexp = 0
var dragonsNexp = 0

//Function to print a personalized letter
func teamLetter(gaurdians parents: String, name: String, team: String, practice: String) {
    print("Dear \(parents). This letter is to inform you that your child \(name) will be playing on team '\(team)' this season. Practice will begin \(practice). Please do not miss this date as we will be going over rules and regulations for the league, passing out team jerseys, and playing a few 'Get to know your team' exercises. \n")
}

//Player to Team Sorting

for player in prelimanary {
    var team = String()
    var practice = String()
    if sharksExp < expPlayersCount() && player["exp"] as! Bool! == true && sharks.count < countPTeam(){
        sharks += [[player]]
        sharksExp += 1
        team = "Sharks"
        practice = "Dec 1, 1pm"
    }else if player["exp"] as! Bool! == false && sharksNexp < notExpCount() && sharks.count < countPTeam(){
        sharks += [[player]]
        sharksNexp += 1
        team = "Sharks"
        practice = "Dec 1, 1pm"
    }else if raptorsExp < expPlayersCount() && player["exp"] as! Bool! == true && raptors.count < countPTeam(){
        raptors += [[player]]
        raptorsExp += 1
        team = "Raptors"
        practice = "Dec 1, 3pm"
        
    }else if player["exp"] as! Bool! == false && raptorsNexp < notExpCount() && raptors.count < countPTeam(){
        raptors += [[player]]
        raptorsNexp += 1
        team = "Raptors"
        practice = "Dec 1, 3pm"
        
    }else if dragonsExp < expPlayersCount() && player["exp"] as! Bool! == true && dragons.count < countPTeam(){
        dragons += [[player]]
        dragonsExp += 1
        team = "Dragons"
        practice = "Dec 2, 1pm"
        
    }else if player["exp"] as! Bool! == false && dragonsNexp < notExpCount() && dragons.count < countPTeam(){
        dragons += [[player]]
        dragonsNexp += 1
        team = "Dragons"
        practice = "Dec 2, 1pm"
        
    }
    //Uses the teamLetter function to print a letter to the gaurdians
    teamLetter(gaurdians: player["gaurdians"] as! String!, name: player["name"] as! String!, team: team, practice: practice)
}







