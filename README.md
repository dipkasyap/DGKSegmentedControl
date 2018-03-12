# DGKSegmentedControl

![screen shot 2018-03-12 at 2 21 49 pm](https://user-images.githubusercontent.com/12591229/37275255-c34ae2a8-2606-11e8-967f-04971706bd11.png)


# How to use

1. Drag and drop DGKSegmentedControl folder to your project. 
2. Place a "View" on storyboard inteface builder, and assign DGKSegmentedControl class to that view. 
3. make outlet connection.

  `@IBOutlet weak var segmentControl: DGKSegmentControl!`
    
4. Pass titles for your segemnts 
    
    `override func viewDidLoad() {
        super.viewDidLoad()
    
        //Setup
        segmentControl.titles = ["First", "Second"] 
    }`
    
5. Connect IBAction with TouchUpInside option. 
    ![screen shot 2018-03-12 at 3 09 02 pm](https://user-images.githubusercontent.com/12591229/37276007-b82853f4-2608-11e8-8c8f-949250aff2cb.png)

    
    `@IBAction func segmentDidChanged(_ sender: DGKSegmentControl) {
        self.lbl.text = sender.titles[sender.selectedIndex]
    }`
    
