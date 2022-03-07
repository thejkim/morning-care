//
//  ViewController.swift
//  myFirstAppSB
//
//  Created by Joeun Kim on 12/30/20.
//

import UIKit

class CityForecastVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    
    // WeeklyContentViewContainers
    @IBOutlet var weeklyContentContainerOfDays: Array<UIView>! // day 1~5
    
    var weeklyContentViewConstraints = [NSLayoutConstraint]() // height=0

    // WeeklyContentViews
    @IBOutlet var weeklyContentOverviewViews: Array<UIView>! // overview
    @IBOutlet var weeklyContentHourlyViews: Array<UICollectionView>! // hourly-view
    
    var weeklyContentContainerViewHeight: CGFloat!
    
    @IBOutlet weak var todayOutfitContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hourlyCollectionView.backgroundColor = UIColor.clear
        for hourlyView in weeklyContentHourlyViews {
            hourlyView.isHidden = true
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        weeklyContentContainerViewHeight = weeklyContentContainerOfDays[0].frame.height // height of expanded view
 
        // make all WeeklyContentContainerViews collapsed as default except for today
        var constHeightEqualToZero: NSLayoutConstraint!
        for i in 1 ..< weeklyContentContainerOfDays.count {
            weeklyContentContainerOfDays[i].translatesAutoresizingMaskIntoConstraints = false
            constHeightEqualToZero = weeklyContentContainerOfDays[i].heightAnchor.constraint(equalToConstant: 0)
            weeklyContentViewConstraints.append(constHeightEqualToZero)
            constHeightEqualToZero.isActive = true // collapse
        }
        
        // TODO: -horizontal spacing=2 between cells of collectionview - not working
//        let width = WeeklyHourlyCellContainer.frame.size.width
//        let height = WeeklyHourlyCellContainer.frame.size.height
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: width, height: height)
//        layout.minimumInteritemSpacing = 2
//        layout.minimumLineSpacing = 1000.0 // keep collectionview as a single row
//        WeeklyContentHourlyViewOfDay1.collectionViewLayout = layout
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = hourlyCollectionView.dequeueReusableCell(withReuseIdentifier: "HourlyCollectionViewCell", for: indexPath) as! HourlyCollectionViewCell
        return cell
    }
    
    @IBAction func btnWeeklyHeaderOfDayTouched(_ sender: UIButton) {
        print("\(sender.tag)")
        if(weeklyContentContainerOfDays[sender.tag].frame.height == 0) {
            for days in weeklyContentViewConstraints {
                print(days)
                if(days.constant == self.weeklyContentContainerViewHeight) {
                    UIView.animate(withDuration: 0.35, animations: {
                        days.constant = 0
                        self.view.layoutIfNeeded()
                    }, completion: {_ in
                    })
                }
            }
            UIView.animate(withDuration: 0.35, animations: {
                self.weeklyContentViewConstraints[sender.tag-1].constant = self.weeklyContentContainerViewHeight
                self.view.layoutIfNeeded()
            }, completion: {_ in
            })
        } else {
            UIView.animate(withDuration: 0.35, animations: {
                self.weeklyContentViewConstraints[sender.tag-1].constant = 0
                self.view.layoutIfNeeded()
            }, completion: {_ in
            })
        }
    }
    
    @IBAction func switchWeeklyDayContentView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: // overview
//            for overview in 1 ..< WeeklyContentOverviewDayViews.count {
//
//            }
            for i in 0 ..< weeklyContentOverviewViews.count {
                weeklyContentOverviewViews[i].isHidden = false
                weeklyContentHourlyViews[i].isHidden = true
            }
            
//            for overview in weeklyContentOverviewViews {
//                overview.isHidden = false
//            }
//            for hourlyView in weeklyContentHourlyViews {
//                hourlyView.isHidden = true
//            }
            break
        case 1: // hourly-view
            for i in 0 ..< weeklyContentOverviewViews.count {
                weeklyContentOverviewViews[i].isHidden = true
                weeklyContentHourlyViews[i].isHidden = false
            }
//            
//            for overview in weeklyContentOverviewViews {
//                overview.isHidden = true
//            }
//            for hourlyView in weeklyContentHourlyViews {
//                hourlyView.isHidden = false
//            }
            break
        default:
            break           
        }
    }
}

