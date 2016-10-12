
import UIKit
import XCPlayground

struct Person { // Model
    let firstName: String
    let lastName: String
}

class GreetingViewController : UIViewController { // View + Controller
    var person: Person!
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showGreetingButton.addTarget(self, action: #selector(didTapButton(button:)), for: .touchUpInside)
        self.showGreetingButton.setTitle("点我", for: UIControlState.normal)
        self.view.addSubview(self.showGreetingButton)
        self.greetingLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(self.greetingLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showGreetingButton.frame = CGRect(x: self.view.bounds.width/2 - 100/2, y: self.view.bounds.height/2 - 40/2, width: 100, height: 40)
        self.greetingLabel.frame = CGRect(x: self.view.bounds.width/2 - 200/2, y:  40/2, width: 200, height: 40)
        self.greetingLabel.textColor = UIColor.red
    }
    
    func didTapButton(button: UIButton) {
        let greeting = "Hello" + " " + self.person.firstName + " " + self.person.lastName
        self.greetingLabel.text = greeting
        
    }
    // layout code goes here
}
// Assembling of MVC
let model = Person(firstName: "David", lastName: "Woo")
let view = GreetingViewController()
view.person = model;

XCPlaygroundPage.currentPage.liveView = view.view
