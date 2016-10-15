import Foundation
// Player constants with dictionary of player info
let joeSmith:[String:Any] = ["name": "Joe Smith", "height": 42, "exp": true, "gaurdians": "Jim & Jan Smith"]
let jillTanner:[String:Any] = ["name": "Jill Tanner", "height": 36, "exp": true, "gaurdians": "Clara Tanner"]
let billBon:[String:Any] = ["name": "Bill Bon", "height": 43, "exp": true, "gaurdians": "Sara & Jenny Bon"]
let evaGordon:[String:Any] = ["name": "Eva Gordon", "height": 45, "exp": false, "gaurdians": "Wendy & Mike Gordon"]
let mattGill:[String:Any] = ["name": "Matt Gill", "height": 40, "exp": false, "gaurdians": "Charles & Silvia Gill"]
let kimmyStein:[String:Any] = ["name": "Kimmy Stein", "height": 41, "exp": false, "gaurdians": "Bill & Hillary Stein"]
let sammyAdams:[String:Any] = ["name": "Sammy Adams", "height": 45, "exp": false, "gaurdians": "Jeff Adams"]
let karlSagan:[String:Any] = ["name": "Karl Sagan", "height": 42, "exp": true, "gaurdians": "Heather Bledsoe"]
let suzaneGreenberg:[String:Any] = ["name": "Suzane Greenberg", "height": 44, "exp": true, "gaurdians": "Henrietta Dumas"]
let salDali:[String:Any] = ["name": "Sal Dali", "height": 41, "exp": false, "gaurdians": "Gala Dali"]
let joeKavalier:[String:Any] = ["name": "Joe Kavalier", "height": 39, "exp": false, "gaurdians": "Sam & Elaine Kavalier"]
let benFinkelstein:[String:Any] = ["name": "Ben Finkelstein", "height": 44, "exp": false, "gaurdians": "Aaron & Jill Finkelstein"]
let diegoSoto :[String:Any] = ["name": "Diego Soto", "height": 41, "exp": true, "gaurdians": "Robin & Sarika Soto"]
let chloeAlaska :[String:Any] = ["name": "Chloe Alaska", "height": 47, "exp": false, "gaurdians": "David & Jamie Alaska"]
let arnoldWillis :[String:Any] = ["name": "Arnold Willis", "height": 43, "exp": false, "gaurdians": "Claire Willis"]
let phillipHelm :[String:Any] = ["name": "Phillip Helm", "height": 44, "exp": true, "gaurdians": "Thomas Helm & Eva Jones"]
let lesClay :[String:Any] = ["name": "Les Clay", "height": 42, "exp": true, "gaurdians": "Wynonna Brown"]
let herchelKrustofski :[String:Any] = ["name": "Herschel Krustofski", "height": 45, "exp": true, "gaurdians": "Hyman & Rachel Krustofski"]

//Array of Players
var prelimanary = [joeSmith,jillTanner,billBon,evaGordon,mattGill,kimmyStein,sammyAdams,karlSagan,suzaneGreenberg,salDali,joeKavalier,benFinkelstein,diegoSoto,chloeAlaska,arnoldWillis,phillipHelm,lesClay,herchelKrustofski,]

//Variables for each team and an array of all teams
var sharks = [[String:Any]]()
var raptors = [[String:Any]]()
var dragons = [[String:Any]]()
var teams = [sharks,raptors,dragons]

//Find max Players/Team and assigns to constant pPTeam
func countPTeam() -> Int {
    let count = prelimanary.count / teams.count //Divides count of prelimanary[] from count of teams[] and assigns to constant 'count'
    return count
}
let pPTeam = countPTeam()

//Find max Experienced Players/Team assigns to constant expPCount
func expPlayersCount() -> Int {
    var countAs = 0
    for player in prelimanary {                 //Sequences through all players in preliminary
        if player["exp"] as! Bool! == true  {   //Looks for Key:Value pair "exp": True
            countAs += 1                        //var countAs increments by 1 if pair is found
        }
    }
    let expPerTeam = countAs / teams.count      //Divides # of exp players by the # of teams and assigns to constant expPerTeam
    return expPerTeam
}
let expPCount = expPlayersCount()

//Find max non Expierenced Players/Team assigns to constant notExpPCount
func notExpCount() -> Int {
    var countAs = 0
    for player in prelimanary {                 //Sequences through all players in preliminary
        if player["exp"] as! Bool! == false  {  //Looks for Key:Value pair "exp": False
            countAs += 1                        //var countAs increments by 1 if pair is found
        }
    }
    let nonExpPerTeam = countAs / teams.count   //Divides # of non-exp players by the # of teams and assigns to constant nonExpPerTeam
    return nonExpPerTeam
}
let notExpPCount = notExpCount()

//sorts preliminary[] into exp[:] and nonExp[:]
var expPlayers = [Int:[String: Any]]()
var nonExpPlayers = [Int:[String: Any]]()
var index = 0
for player in prelimanary{                              //Sequences through all players in preliminary
    if player["exp"] as! Bool == true {                 //If player["exp"] == True
        expPlayers.updateValue(player, forKey: index)   //Player is added to dictionary expPlayers and assigned an key from var index
        index += 1                                      //increments index by 1
    }else{
        nonExpPlayers.updateValue(player, forKey: index)////Player is added to dictionary nonExpPlayers and assigned an key from var index
        index += 1
    }
}
//Finds shortest or tallest player in arrays expPlayers and nonExpPlayers respectively
func shortTall(array:[Int:[String:Any]],height:String) -> (Int,[String:Any]) {
    var player : [String : Any] = [:]
    var index = 0
    for (i,players) in array {              //sequences through array called in initial Func call
        if player.count == 0{               //If var player is empty var player is assigned player from respective array
            player = players                //and players Key is assigned to var index
            index = i
        }else if height == "shortest" && players["height"] as! Int! <= player["height"] as! Int!{
            player = players                //If perameter height == "shortest" and players height in array is less than var player height
            index = i                       //player is exchanged with this player and index is updated
        }else if height == "tallest" && players["height"] as! Int! >= player["height"] as! Int!{
            player = players                //If perameter height == "tallest" and players height in array is more than var player height
            index = i                       //player is exchanged with this player and index is updated
        }
    }
    return (index, player)
}
//Sorts players into three teams by expierience and height. Order is Key to averaging heights per team
func sort(inout team: [[String:Any]]){                   //Takes a team as a perameter
    var exp = 0                                                                         //Stores # of exp players added to team
    var notExp = 0                                                                      //Stores # of non-exp players added to team
    while team.count < pPTeam {
        if exp < expPCount && team.count < pPTeam{
            team.append(shortTall(expPlayers, height: "shortest").1)                    //adds shortest player in expPlayers to team
            expPlayers.removeValueForKey(shortTall(expPlayers, height: "shortest").0)
            exp += 1
        }
        if exp < expPCount && team.count < pPTeam{
            team.append(shortTall(expPlayers, height: "tallest").1)                     //adds tallest player in expPlayers to team
            expPlayers.removeValueForKey(shortTall(expPlayers, height: "tallest").0)
            exp += 1
        }
        if notExp < notExpPCount && team.count < pPTeam{
            team.append(shortTall(nonExpPlayers, height: "tallest").1)                  //adds tallest player in nonExpPlayers to team
            nonExpPlayers.removeValueForKey(shortTall(nonExpPlayers, height: "tallest").0)
            notExp += 1
        }
        if notExp < notExpPCount && team.count < pPTeam{
            team.append(shortTall(nonExpPlayers, height: "shortest").1)                 //adds shortest player in nonExpPlayers to team
            nonExpPlayers.removeValueForKey(shortTall(nonExpPlayers, height: "shortest").0)
            notExp += 1
        }
        //order is important!!! Taking Shortest and tallest of both exp and non-exp evens out the averages between teams.
        //and putting the order of non-exp reverse to the exp is important if the sequence is only run through partially
        //The sequence is run through one full turn and then only two perameters are met in the while loop for the second 
        //run given a max team count of six players.
    }
}
sort(&sharks)
sort(&raptors)
sort(&dragons)


//Function to print a personalized letter
func teamLetter(gaurdians parents: Any, name: Any, team: String, practice: String) {
    print("Dear \(parents), This letter is to inform you that your child \(name) will be playing on team '\(team)' this season. Practice will begin \(practice). Please do not miss this date as we will be going over rules and regulations for the league, passing out team jerseys, and playing a few 'Get to know your team' exercises. \n")}

//The teamLetter() func takes perameters parents,team,name and practice from each of the specific team for loops
//to populate the print() function with a letter

for player in sharks{
    var team = "Sharks"
    var practice = "March 17, 3pm"
    var child = player["name"]!
    var gaurdians = player["gaurdians"]!
    teamLetter(gaurdians: gaurdians, name: child, team: team, practice: practice)
}

for player in raptors{
    var team = "Raptors"
    var practice = "March 18, 1pm"
    var child = player["name"]!
    var gaurdians = player["gaurdians"]!
    teamLetter(gaurdians: gaurdians, name: child, team: team, practice: practice)
}

for player in dragons{
    var team = "Dragons"
    var practice = "March 17, 1pm"
    var child = player["name"]!
    var gaurdians = player["gaurdians"]!
    teamLetter(gaurdians: gaurdians, name: child, team: team, practice: practice)
}

