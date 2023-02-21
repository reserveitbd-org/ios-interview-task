//
//  CustomTabBarViewController.swift
//  iOS-InterviewTask
//
//  Created by Md. Faysal Ahmed on 21/2/23.
//

import Foundation
import UIKit

protocol TabBarProtocol: AnyObject {
    func tabBarChanged(index: Int)
}


class CustomTabBarViewController:  UITabBarController, UITabBarControllerDelegate {
    
    weak var tabBarDelegate: TabBarProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCustomTabBar()
        self.tabBar.isHidden = true
    }
    
    func getStoryboard(name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }

    func setupCustomTabBar() {
        // 1
        guard let createVC = loadVCfromStoryBoard(name: "Main", identifier: "ViewControllerID") as? ViewController else{
            return
        }
        let secondItem = HomeNabViewController(rootViewController: createVC)

        // 2
        guard let favoriteVC = loadVCfromStoryBoard(name: "Search", identifier: "SearchID") as? SearchVC else{
            return
        }
        let thirdItem = HomeNabViewController(rootViewController: favoriteVC)


        // 0
        guard let scannerVC = loadVCfromStoryBoard(name: "BookMark", identifier: "BookMarkViewControllerID") as? BookMarkViewController else{
            return
        }
        let firstItem = HomeNabViewController(rootViewController: scannerVC)


        // 3
        guard let historyVC = loadVCfromStoryBoard(name: "Time", identifier: "TimeID") as? TimeVC else{
            return
        }
        let forthItem = HomeNabViewController(rootViewController: historyVC)

        // 4
        guard let settingVC = loadVCfromStoryBoard(name: "Account", identifier: "AccountID") as? AccountVC else{
            return
        }
        let fifthItem = HomeNabViewController(rootViewController: settingVC)


        let tabBarItemList = [secondItem, thirdItem,firstItem, forthItem, fifthItem]
        self.viewControllers = tabBarItemList

        self.delegate = self


    }
}
