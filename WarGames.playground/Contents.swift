// The completed code is available on GitHub: https://github.com/jloloew/WarGames
// Copyright 2016 CocoaNuts

// It's okay if you don't understand everything here. In fact, I'd be impressed if you do.
// In a playground, code is executed as you write it, and the result of running each line
// appears on the right side of the window.

import Foundation

/// A character in the story.
class Character {
	var name: String
	var currentlySaying: String? {
		// This didSet gets called each time currentlySaying is changed.
		didSet {
			// This double question mark thing means "if currentlySaying is nil, replace it with the thing after the ??"
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

// Let's create our characters.
var david = Character(name: "David Lightman")
var wopr = Character(name: "WOPR")

// And so begins our tale...
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

// Set up for the game
var ussr = Country(name: "Russia", cityNames: ["Moscow", "St. Petersburg", "Volgograd"])
ussr.leader = david
var usa = Country(name: "United States", cityNames: ["Seattle", "Chicago", "Washington", "New York"])
usa.leader = wopr

// The rest is up to you...
