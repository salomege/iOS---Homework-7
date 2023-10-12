 import Cocoa

class SuperEnemy {
    var name: String
    var hitPoint: Int
    
    init  (name: String, hitPoint: Int) {
        self.name = name
        self.hitPoint = hitPoint
    }
}

Protocol Superhero {
    var name: String { get }
    var alias: String { get }
    var isEvil: Bool { get }
    var superPowers: [String: Int] { get }
    
    func attack(target: SuperEnemy) -> Int
    func performSuperPower(target: SuperEnemy) -> Int
}

extension Superhero {
    func printSuperheroInfo() {
        print("Superhero Info:")
        print("Name: \(name)")
        print("SuperPowers:")
        
        for (power, remainingPower) in superPowers {
            print(" - \(power): Remaining Power \(remainingPower)")
        }
    }
}

struct Spiderman: Superhero {
    var name: String
    var alias: String
    var isEvil: Bool
    var superPowers: [String: Int]
    
    init(name: String, alias: String, isEvil: Bool, superPowers: [String: Int]) {
        self.name = name
        self.alias = alias
        self.isEvil = isEvil
        self.superPowers = superPowers
    }
    
    func attack(target: SuperEnemy) -> Int {
        let damage = Int.random(in: 20...40)
        target.hitPoint -= damage
        return target.hitPoint
    }
    
    func performSuperPower(target: SuperEnemy) -> Int {
            if let (power, powerValue) = superPowers.randomElement() {
                target.hitPoint -= powerValue
                superPowers.removeValue(forKey: power)
                print("Spiderman used \(power) superpower. Enemy's hit points: \(target.hitPoint)")
            }
            
            return target.hitPoint
        }
    }
class SuperheroSquad<T: Superhero> {
    var superheros: [T]
    init(superheros: [T]) {
        self.superheros = superheros
    }
    func listSuperheroes() {
            print("Superheroes in the Squad:")
            for superhero in superheros {
                print("Name: \(superhero.name), Alias: \(superhero.alias)")
            }
        }
    }

let spiderman = Spiderman(name: "Peter Parker", alias: "Spiderman", isEvil: false, superPowers: ["Web Slinging": 30, "Super Strength": 40])
let squad = SuperheroSquad(superheros: [spiderman])
squad.listSuperheroes()
