import UIKit

/*=========================================================================>>
 
 ASSIGNMENT 4
 
 - Create a base protocol with common properties or methods for monsters.
 - Derive two child protocols for specific monster types.
 - Create four classes (two flying and two water monsters) conforming to these child protocols.
 - Write a function that accepts a collection of Monster objects and prints details about each.
 */

/*=========================================================================>>
 Step 1: Define the Base Protocol
    Monster with:
        var name: String { get }
        func roar() -> String
 */

protocol Monster {
    var name: String { get }
    
    func roar() -> String
} // Monster


/*=====================================================================>>
 Step 2: Define Child Protocols
    - FlyingMonster with:
        var wingSpan: Double { get }
        func fly() -> String
    - WaterMonster with:
        var swimSpeed: Int { get }
        func swim() -> String
 */

protocol FlyingMonster: Monster {
    var wingSpan: Double { get }
    
    func fly() -> String
}

protocol WaterMonster: Monster {
    var swimSpeed: Int { get }
    
    func swim() -> String
}

/*
 Step 3: Create Four Classes
    Dragon and Gryphon conforming to FlyingMonster.
    Kraken and Merfolk conforming to WaterMonster.
 */

// Flying Monsters
class Dragon: FlyingMonster {
    var name: String
    var wingSpan: Double

    init(name: String, wingSpan: Double) {
        self.name = name
        self.wingSpan = wingSpan
    }

    func roar() -> String {
        return "\(name) roars fiercely, shaking the ground!"
    }

    func fly() -> String {
        return "\(name) spreads its \(wingSpan)-meter wings and takes to the sky!"
    }
}

class Gryphon: FlyingMonster {
    var name: String
    var wingSpan: Double

    init(name: String, wingSpan: Double) {
        self.name = name
        self.wingSpan = wingSpan
    }

    func roar() -> String {
        return "\(name) screeches with a piercing cry!"
    }

    func fly() -> String {
        return "\(name) soars high with its majestic \(wingSpan)-meter wings!"
    }
}

// Water Monsters
class Kraken: WaterMonster {
    var name: String
    var swimSpeed: Int

    init(name: String, swimSpeed: Int) {
        self.name = name
        self.swimSpeed = swimSpeed
    }

    func roar() -> String {
        return "\(name) bellows from the deep, causing waves to crash!"
    }

    func swim() -> String {
        return "\(name) glides through the water at \(swimSpeed) knots!"
    }
}

class Merfolk: WaterMonster {
    var name: String
    var swimSpeed: Int

    init(name: String, swimSpeed: Int) {
        self.name = name
        self.swimSpeed = swimSpeed
    }

    func roar() -> String {
        return "\(name) sings an enchanting melody that stirs the seas!"
    }

    func swim() -> String {
        return "\(name) swims gracefully at \(swimSpeed) knots!"
    }
}

/*=============================================>>
 Step 4: Create a Function to Handle Monsters
    printMonsterDetails(monsters: [Monster]) to print information for each monster, using polymorphism to call appropriate methods based on their type.
 */
func printMonsterDetails(monsters: [Monster]) {
    for monster in monsters {
        print(monster.roar())
        
        if let flyingMonster = monster as? FlyingMonster {
            print(flyingMonster.fly())
        } else if let waterMonster = monster as? WaterMonster {
            print(waterMonster.swim())
        }
        
        print("-----------------------")
    }
}

/*=========================================>>
 - **Test Your Implementation:**
   - Create instances of SoftwareEngineer and TeamManager with appropriate values.
   - Add these instances to an array of type [Worker].
   - Call companyReport() with the array and verify the output.
 */
var dragon = Dragon(name: "Fire Drake", wingSpan: 15.0)
var gryphon = Gryphon(name: "Sky Hunter", wingSpan: 12.0)
var kraken = Kraken(name: "Sea Terror", swimSpeed: 20)
var merfolk = Merfolk(name: "Coral Queen", swimSpeed: 10)

var monsters: [Monster] = [dragon, gryphon, kraken, merfolk]

printMonsterDetails(monsters: monsters)


/*=========================>>
 Sample Output
 Fire Drake roars fiercely, shaking the ground!
 Fire Drake spreads its 15.0-meter wings and takes to the sky!
 -----------------------
 Sky Hunter screeches with a piercing cry!
 Sky Hunter soars high with its majestic 12.0-meter wings!
 -----------------------
 Sea Terror bellows from the deep, causing waves to crash!
 Sea Terror glides through the water at 20 knots!
 -----------------------
 Coral Queen sings an enchanting melody that stirs the seas!
 Coral Queen swims gracefully at 10 knots!
 */
