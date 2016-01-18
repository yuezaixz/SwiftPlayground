import Foundation

//Niuniu是一种可耻的赌博游戏
struct NiuniuCard {
    enum Suit:Character {
        case Spades = "♠️",Hearts="❤️",Dismonds="♦️",Clubs="♣️"
    }
    enum Rank:Int {
        case Two = 2,Three,Four,Five,Six,Seven,Eight,Nine,Ten
        case Jack,Queen,King,Ace
    }
    
    struct Values {
        enum ValueType {
            case Val,Ten,Flower
        }
        let type:ValueType
        let second:Int
        let suit:Suit
        
        init(suit:Suit,rank:Rank){
            switch rank{
            case .Ten:
                self.type = .Ten
            case .Jack,.Queen,.King:
                self.type = .Flower
            default:
                self.type = .Val
            }
            switch rank{
            case .Ace:
                self.second = 1
            default:
                self.second = rank.rawValue
            }
            self.suit = suit
        }
        
        var cardValue:Int {
            switch type {
            case .Flower:
                return 10
            default:
                return second
            }
        }
    }
    
    let rank:Rank,suit:Suit
}
struct NiuniuSerial {
    let cards = [NiuniuCard]()
}

func combine(var items:[NiuniuCard],cCount:Int) -> [[NiuniuCard]]{
    var resultItems = [[NiuniuCard]]()
    if items.count == cCount {
        resultItems.append(items)
    } else if cCount == 1 {//1直接返回
        for item in items {
            resultItems.append([item])
        }
    } else {
        let first = items.removeFirst()
        
        //JOIN
        let joinItems = combine(items, cCount: cCount-1)
        for var joinItem in joinItems {
            joinItem.append(first)
            resultItems.append(joinItem)
        }
        
        //PLUS
        let plusItems = combine(items, cCount: cCount)
        resultItems.appendContentsOf(plusItems)
    }
    return resultItems
}

extension NiuniuCard {//扩展Card类
    var value:Values {
        return Values(suit: self.suit, rank: self.rank)
    }
    var description:String {
        return "\(suit.rawValue)\(rank))"
    }
    
    func isEquals(card:NiuniuCard) -> Bool {
        return self.rank == card.rank && self.suit == card.suit;
    }
}

extension NiuniuSerial {//扩展Serial类
    func isNiuniu() -> Bool {
        let sum = self.cards.reduce(0, combine: {$0+$1.value.cardValue})
        return sum % 10 == 0
    }
    
    func isAllFlower() -> Bool {
        for card in self.cards {
            if card.value.type != NiuniuCard.Values.ValueType.Flower {
                return false
            }
        }
        return true
    }
    
    //返回的是niu几
    func hadNiu() -> Int {
        let items = combine(self.cards, cCount: 5)
        for item in items {
            let sum = item.reduce(0, combine: {$0+$1.value.cardValue})
            if sum % 10 == 0 {
                for findCard in item {
                    let niuValueCards = self.cards.filter({ !$0.isEquals(findCard)})
                    return niuValueCards.reduce(0, combine: {$0+$1.value.cardValue})%10
                }
            }
        }
        return 0
    }
    
    //翻倍的倍数
    func timesForSerial() -> Int {
        if self.isAllFlower() {
            return 5
        } else if self.isNiuniu() {
            return 4
        }
        let niuVal = self.hadNiu()
        if niuVal == 9 {
            return 3
        } else if niuVal >= 7 {
            return 2
        } else if niuVal > 0 {
            return 1
        }
        return 0
    }
    
    func compare(target:NiuniuSerial) -> Int {
        let sourceTimes = self.timesForSerial()
        let targetTimes = target.timesForSerial()
        if sourceTimes > targetTimes {
            return sourceTimes
        } else if sourceTimes < targetTimes {
            return -targetTimes
        } else {
            return self.cards.maxElement({ (sourceCard, targetCard) -> Bool in
                return sourceCard.value.second >= targetCard.value.second
            })!.value.second > target.cards.maxElement({ (sourceCard, targetCard) -> Bool in
                return sourceCard.value.second >= targetCard.value.second
            })!.value.second ? max(1, sourceTimes):min(-1, -targetTimes);
        }
    }
}

extension NiuniuCard.Rank {
    static func fromRaw(rawValue:Int) -> NiuniuCard.Rank {
        switch rawValue {
        case 2:
            return NiuniuCard.Rank.Two
        case 3:
            return NiuniuCard.Rank.Three
        case 4:
            return NiuniuCard.Rank.Four
        case 5:
            return NiuniuCard.Rank.Five
        case 6:
            return NiuniuCard.Rank.Six
        case 7:
            return NiuniuCard.Rank.Seven
        case 8:
            return NiuniuCard.Rank.Eight
        case 9:
            return NiuniuCard.Rank.Nine
        case 10:
            return NiuniuCard.Rank.Ten
        case 11:
            return NiuniuCard.Rank.Jack
        case 12:
            return NiuniuCard.Rank.King
        case 13:
            return NiuniuCard.Rank.Queen
        default:
            return NiuniuCard.Rank.Ace
        }
    }
}

class NiuniuPlayer{
    enum PlayerType:Int {
        case robot = 0,player
    }
    var name:String
    var score:Int
    var type:PlayerType
    var cards = [NiuniuCard]()
    init(name:String,score:Int,type:PlayerType){
        self.name = name
        self.score = score
        self.type = type
    }
    
    func description() -> String{
        return "\(name):\(score)"
    }
}

class NiuniuGame {
    enum GameType:Int {
        case robot = 0,match
    }
    
    var banker:NiuniuPlayer
    
    var players = [NiuniuPlayer]()
    var robots = [NiuniuPlayer]()
    var gameType = GameType.robot
    var cards = [NiuniuCard]()
    
    init(banker:NiuniuPlayer){
        self.banker = banker
        let suits: [NiuniuCard.Suit] = [.Hearts, .Dismonds, .Clubs, .Spades]
        for i in 1...13 {
            for suit in suits {
                cards.append(NiuniuCard(rank: NiuniuCard.Rank.fromRaw(i), suit: suit))
            }
        }
    }
    
}

extension NiuniuGame {//增加开始后初始化机器人的功能和添加机器人等功能
    func addRobot(){
        self.robots.append(NiuniuPlayer(name: "Rebot\(self.robots.count+1)", score: 0, type: .robot))
    }
    func addRobot(robotCount:Int){
        for _ in 0..<robotCount {
            self.addRobot()
        }
    }
    convenience init(banker:NiuniuPlayer,robotCount:Int){
        self.init(banker:banker)
        self.addRobot(robotCount)
    }
}

extension NiuniuGame {//增加玩家的相关函数
    func addPlayer(player:NiuniuPlayer){
        switch player.type {
        case .player:
            self.addPlayer(player)
        case .robot:
            self.robots.append(player)
        }
    }
    func addPlayer(players:NiuniuPlayer...){
        for player in players {
            self.addPlayer(player)
        }
    }
}

extension NiuniuPlayer {
    func clearLastCards() {
        self.cards.removeAll()
    }
    func cardCount() -> Int {
        return self.cards.count
    }
}

extension NiuniuGame {
    func cardForRandom() -> NiuniuCard {
        return self.cards[Int(arc4random()) % self.cards.count]
    }
}




















