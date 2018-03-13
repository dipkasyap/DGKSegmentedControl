
import Foundation
import UIKit


class DGKSegmentControl: UIControl {
    
    ///Provides spacing between segments
    ///Default is 1.5
    @IBInspectable var spacing: CGFloat = 1.5 {
        didSet {
            self.stackView.spacing = spacing
        }
    }
    
    @IBInspectable var textFont: Int = 0 {
        didSet {
            self.refresh()
        }
    }
    
    @IBInspectable var customFont: Bool = false
    
    @IBInspectable var selectedColor:UIColor = UIColor(red: 0.976, green: 0.576, blue: 0.380, alpha: 1.00) {
        
        didSet {
            self.updateColor()
        }
    }
    
    @IBInspectable var unselectedColor:UIColor = UIColor(red: 0.231, green: 0.235, blue: 0.243, alpha: 1.00){
        
        didSet {
            self.updateColor()
        }
    }
    
    @IBInspectable var selectedTextColor:UIColor = .black {
        
        didSet {
            self.updateColor()
        }
    }
    
    @IBInspectable var unselectedTextColor:UIColor = .white{
        
        didSet {
            self.updateColor()
        }
    }
    
    fileprivate func refresh() {
        //flushing
        self.stackView.subviews.forEach{view in
            self.stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        //readding changed new segments
        for i in 0...self.titles.count-1 {
            
            let title = titles[i]
            let button = UIButton()
            button.backgroundColor = .gray
            button.setTitle(title, for: .normal)
            button.tag = i
            button.addTarget(self, action: #selector(self.indexTapped(_:)), for: .touchDown)
            self.stackView.addArrangedSubview(button)
        }
    }
    
    var titles:[String] = ["first","Second"] {
        didSet {
            
            self.refresh()
            self.updateColor()
        }
    }
    
    var selectedIndex = 0 {
        didSet {
            self.updateColor()
        }
    }
    
    var selectedTitle:String {
        get{
            return self.titles[self.selectedIndex]
        }
    }
    
    
    private func createSegments()->[UIView] {
        
        var views = [UIView]()
        
        for i in 0...self.titles.count-1 {
            
            let title = titles[i]
            let button = UIButton()
            button.backgroundColor = .gray
            button.setTitle(title, for: .normal)
            button.tag = i
            button.addTarget(self, action: #selector(self.indexTapped(_:)), for: .touchDown)
            views.append(button)
        }
        
        return views
    }
    
    lazy var stackView:UIStackView  = {
        var view = UIStackView(arrangedSubviews:self.createSegments())//views)
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = self.spacing
        return view
    }()
    
    
    //MARK:- init
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.initialSetpup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialSetpup()
    }
    
    func initialSetpup()  {
        
        self.addSubview(self.stackView)
        
        self.layer.cornerRadius = 8
        self.manageConstraints()
        
        self.updateColor()
    }
    
    // MARK: - Constraints
    func manageConstraints() {
        self.addConstraintsWithFormat("H:|[v0]|", views: self.stackView)
        self.addConstraintsWithFormat("V:|[v0]|", views: self.stackView)
    }
    
    // MARK: - Refresh
    func updateColor() {
        
        self.stackView.arrangedSubviews.forEach { button in
            
            if let button = button as? UIButton {
                
                UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn], animations: {
                    button.backgroundColor = button.tag == self.selectedIndex ? self.selectedColor : self.unselectedColor
                    button.setTitleColor(button.tag == self.selectedIndex ? self.selectedTextColor : self.unselectedTextColor, for: .normal)
                }, completion: {completd in
                })
            }
        }
    }
    
    // MARK: - Actions
    @objc func indexTapped(_ sender:UIButton) {
        
        guard self.selectedIndex != sender.tag else {return}
        self.selectedIndex = sender.tag
        self.sendActions(for: .touchUpInside)
        
    }
}


extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}

