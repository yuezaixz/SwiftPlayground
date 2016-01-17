//Niuniu是一种可耻的赌博游戏
struct NiuniuCard {
    enum Suit:Character {
        case Spades = "♠️",hearts="❤️",Dismonds="♦️",Clubs="♣️"
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
