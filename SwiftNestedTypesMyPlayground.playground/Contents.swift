//: Playground - noun: a place where people can play

struct BlackjackCard {
    enum Suit:Character {
        case Spades = "♠️",hearts="❤️",Dismonds="♦️",Clubs="♣️"
    }
    enum Rank:Int {
        case Two = 2,Three,Four,Five,Six,Seven,Eight,Nine,Ten
        case Jack,Queen,King,Ace
        struct Values {
            let first:Int,second:Int?
        }
        var value:Values {
            switch self{
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack,.Queen,.King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank:Rank,suit:Suit
    var description:String {
        var output = "\(suit.rawValue)\(rank) value is:\(rank.value.first)"
        if let second = rank.value.second {
            output += " or \(second)"
        }
        
        return output
    }
}

//嵌套类型的实例
let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)
print("theAceOfSpades: \(theAceOfSpades.description)")
//"theAceOfSpades: ♠️Ace value is:1 or 11\n"

//嵌套类型的引用
print("\(BlackjackCard.Suit.hearts.rawValue)")