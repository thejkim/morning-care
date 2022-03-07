//
//  MainVC.swift
//  myFirstAppSB
//
//  Created by Joeun Kim on 1/15/21.
//

import UIKit

class MainVC: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var horizontalScrollView: UIScrollView!
    
    var svSize: CGSize!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layoutIfNeeded()
        svSize = horizontalScrollView.frame.size
        horizontalScrollView.delegate = self
        pageControl.numberOfPages = 4;
        setupScrollView()
        
    }
    
    @IBAction func btnSettingTouched(_ sender: UIButton) {
        print("clicked.")
    }
    
    
    @IBAction func tempTouched(_ sender: UIButton) {
        print("asdasdasdasdasd")
    }
    
    func setCityName(to: String) {
        cityNameLabel.text = to
    }
    
    // MARK: - Scroll View Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print(horizontalScrollView.contentOffset)
        pageControl.currentPage = Int(horizontalScrollView.contentOffset.x / CGFloat(svSize.width))

        if(pageControl.currentPage == 0) {
            setCityName(to: "New York")
        } else if(pageControl.currentPage == 1) {
            setCityName(to: "San Francisco")
        } else if(pageControl.currentPage == 2) {
            setCityName(to: "Seoul")
        } else if(pageControl.currentPage == 3) {
            setCityName(to: "Las Vegas")
        }
    }
    
    private func setupScrollView() {
        print("scroll view frame: \(horizontalScrollView.frame)")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1: UIViewController = storyboard.instantiateViewController(withIdentifier: IBconst.cityMainVCId)
        self.addChild(vc1)
        let v1 = vc1.view
        v1!.frame = CGRect(x:0, y:0, width: svSize.width, height: svSize.height)
        
        horizontalScrollView.addSubview(v1!)
        horizontalScrollView.bringSubviewToFront(v1!)
        
        
        let vc2: UIViewController = storyboard.instantiateViewController(withIdentifier: IBconst.cityMainVCId)
        self.addChild(vc2)
        let v2 = vc2.view
        v2!.frame = CGRect(x:svSize.width, y:0, width: svSize.width, height: svSize.height)
        horizontalScrollView.addSubview(v2!)
        horizontalScrollView.bringSubviewToFront(v2!)
        
        let vc3: UIViewController = storyboard.instantiateViewController(withIdentifier: IBconst.cityMainVCId)
        self.addChild(vc3)
        let v3 = vc3.view
        v3!.frame = CGRect(x:svSize.width*2, y:0, width: svSize.width, height: svSize.height)
        horizontalScrollView.addSubview(v3!)
        horizontalScrollView.bringSubviewToFront(v3!)
        
        let vc4: UIViewController = storyboard.instantiateViewController(withIdentifier: IBconst.cityMainVCId)
        self.addChild(vc4)
        let v4 = vc4.view
        v4!.frame = CGRect(x:svSize.width*3, y:0, width: svSize.width, height: svSize.height)
        horizontalScrollView.addSubview(v4!)
        horizontalScrollView.bringSubviewToFront(v4!)
        
        horizontalScrollView.contentSize = CGSize(width: svSize.width*4, height: svSize.height)
        
        
    }
}


/*
// Populate containerview
let storyboard = UIStoryboard(name: "Main", bundle: nil)
var controller: UIViewController = storyboard.instantiateViewController(withIdentifier: "testView") as UIViewController

//add as a childviewcontroller
 addChildViewController(controller)

 // Add the child's View as a subview
 self.view.addSubview(controller.view)
 controller.view.frame = view.bounds
//controller.view.frame = CGRect(x: 0, y: view.center.y, width: view.size.width, height: view.size.height * 0.5)
 controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

 // tell the childviewcontroller it's contained in it's parent
  controller.didMove(toParentViewController: self)
*/
