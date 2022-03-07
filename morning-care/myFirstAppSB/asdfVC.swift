//
//  asdfVC.swift
//  myFirstAppSB
//
//  Created by Joeun Kim on 1/19/21.
//

import UIKit

class asdfVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var horizontalScrollView: UIScrollView!
    var svSize: CGSize!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layoutIfNeeded()
        svSize = horizontalScrollView.frame.size
        horizontalScrollView.delegate = self
        setupScrollView()

        // Do any additional setup after loading the view.
    }
    
    private func setupScrollView() {
        print("scroll view frame: \(horizontalScrollView.frame)")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1: UIViewController = storyboard.instantiateViewController(withIdentifier: "zxcvVC")
        let v1 = vc1.view
        v1!.backgroundColor = .yellow
        v1!.frame = CGRect(x:0, y:0, width: svSize.width, height: svSize.height)
        horizontalScrollView.addSubview(v1!)
        
        let vc2: UIViewController = storyboard.instantiateViewController(withIdentifier: "zxcvVC")
        let v2 = vc2.view
        v2!.backgroundColor = .red
        v2!.frame = CGRect(x:svSize.width, y:0, width: svSize.width, height: svSize.height)
        horizontalScrollView.addSubview(v2!)
        
        horizontalScrollView.contentSize = CGSize(width: svSize.width*2, height: svSize.height)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
