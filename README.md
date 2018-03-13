# DGKSegmentedControl

<p align="center"> 
<img src="https://user-images.githubusercontent.com/12591229/36713674-ded0ca38-1bb6-11e8-8448-1e18b7d345cf.png">
</p>
<p align="center"> 
<img src="https://user-images.githubusercontent.com/12591229/37275255-c34ae2a8-2606-11e8-967f-04971706bd11.png">
</p>

# How to use

1. Drag and drop DGKSegmentedControl folder to your project. 
2. Place a "View" on storyboard inteface builder, and assign DGKSegmentedControl class to that view. 
3. make outlet connection.

          @IBOutlet weak var segmentControl: DGKSegmentControl!
    
4. Pass titles for your segemnts 
    
           override func viewDidLoad() {
             super.viewDidLoad()
        
             //Setup
              segmentControl.titles = ["First", "Second"] 
            }
    
5. Connect IBAction with TouchUpInside option. 

    ![screen shot 2018-03-12 at 3 09 02 pm](https://user-images.githubusercontent.com/12591229/37276007-b82853f4-2608-11e8-8c8f-949250aff2cb.png)

          @IBAction func segmentDidChanged(_ sender: DGKSegmentControl) {
                    //TODO:
                    //self.lbl.text = sender.titles[sender.selectedIndex]
                     print(sender.selectedTitle)
          }
    


# Licence
The MIT License (MIT)

Copyright (c) 2014 Dip Kasyap
(Dpd Ghimire)
dpd.ghimire@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. In App localization in Swift
