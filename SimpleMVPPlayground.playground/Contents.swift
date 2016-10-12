import UIKit
import XCPlayground

struct Person { // Model
    let firstName: String
    let lastName: String
}

protocol GreetingView: class {
    func setGreeting(greeting: String)
}

protocol GreetingViewPresenter {
    init(view: GreetingView, person: Person)
    func showGreeting()
}

class GreetingPresenter : GreetingViewPresenter {
    weak var view: GreetingView?
    let person: Person
    required init(view: GreetingView, person: Person) {
        self.view = view
        self.person = person
    }
    func showGreeting() {
        guard let displayView = self.view else {
            return
        }
        let greeting = "Hello" + " " + self.person.firstName + " " + self.person.lastName
        displayView.setGreeting(greeting: greeting)
    }
}

class GreetingViewController : UIViewController, GreetingView {
    var presenter: GreetingViewPresenter!
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showGreetingButton.addTarget(self, action: #selector(didTapButton(button:)), for: UIControlEvents.touchUpInside)
        self.showGreetingButton.setTitle("点我", for: .normal)
        self.showGreetingButton.setTitleColor(UIColor.red, for: .normal)
        self.greetingLabel.textAlignment = NSTextAlignment.center
        self.greetingLabel.textColor = UIColor.red
        self.view.addSubview(self.showGreetingButton)
        self.view.addSubview(self.greetingLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showGreetingButton.frame = CGRect(x: self.view.bounds.width/2 - 100/2, y: self.view.bounds.height/2 - 40/2, width: 100, height: 40)
        self.greetingLabel.frame = CGRect(x: self.view.bounds.width/2 - 200/2, y: 40, width: 200, height: 40)
    }
    
    func didTapButton(button: UIButton) {
        self.presenter.showGreeting()
    }
    
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
    
    // layout code goes here
}
// Assembling of MVP
let model = Person(firstName: "David", lastName: "Woo")
let view = GreetingViewController()
let presenter = GreetingPresenter(view: view, person: model)
view.presenter = presenter

XCPlaygroundPage.currentPage.liveView = view.view