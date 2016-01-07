//: Playground - noun: a place where people can play

import UIKit

/// A character in the story.
class Character {
	var name: String
	var currentlySaying: String? {
		didSet { // This didSet gets called each time currentlySaying is changed.
			print(currentlySaying ?? "")
		}
	}
	var conversationPartner: Character?
	
	init(name: String) {
		self.name = name
	}
	
	func talkTo(newGuy: Character) {
		conversationPartner = newGuy
		print("\(name) is now talking to \(newGuy.name).")
	}
}

var david = Character(name: "David Lightman")
var wopr = Character(name: "WOPR")

david.talkTo(wopr)
wopr.currentlySaying = "Would you like to play a game?"

enum Game {
	case Chess, Checkers, Backgammon, Poker, TheaterwideBiotoxicAndChemicalWarfare, GlobalThermonuclearWar
}

david.currentlySaying = "Let's play Global Thermonuclear War."
wopr.currentlySaying = "Password: "
david.conversationPartner = nil // stop talking to WOPR

/// Search the web for information.
func google(query: String) -> String? {
	if query == "Who is Dr. Falken's dead son?" {
		return "Joshua"
	} else {
		return nil
	}
}

google("Who is Dr. Falken's dead son?")
david.currentlySaying = "Aha!"

david.talkTo(wopr)
wopr.currentlySaying = "Would you like to play a game?"
david.currentlySaying = "How about a game of Global Thermonuclear War?"
wopr.currentlySaying = "Password: "
david.currentlySaying = "Joshua"
wopr.currentlySaying = "Let us begin."

/// Define one of the sides fighting in this war.
struct Country {
	var name: String
	var leader: Character! // The exclamation point means the leader is aut
	/// An array of tuples, each of which contains the city's name and remaining health.
	var cities: [(name: String, health: Int)]
	var citiesStillStanding: Int
	/// How many missiles we've got left in our arsenal. 100 by default.
	var missiles = 100
	init(name: String, cityNames: [String]) {
		self.name = name
		cities = cityNames.map { return ($0, 100) }
		citiesStillStanding = cityNames.count
	}
}

// allow our existing players to take command of a country
extension Character {
	var country: Country?
}
