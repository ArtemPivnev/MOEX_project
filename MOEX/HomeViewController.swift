//
//  HomeViewController.swift
//  MOEX
//
//  Created by Артем Пивнев on 26.09.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    let transiton = SlideInTransition()
    var topView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func DidTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }

    func transitionToNew(_ menuType: MenuType) {

        topView?.removeFromSuperview()
        switch menuType {
        case .profile:
            let title = String(describing: "Профиль").capitalized
            self.title = title
            guard let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "profile") else { return }
            self.view.addSubview(profileVC.view)
            self.topView = profileVC.view
            addChild(profileVC)
        case .cots:
            let title = String(describing: "Котировки").capitalized
            self.title = title
            guard let cotsVC = self.storyboard?.instantiateViewController(withIdentifier: "cots") else { return }
            self.view.addSubview(cotsVC.view)
            self.topView = cotsVC.view
            addChild(cotsVC)
        case .obotots:
            let title = String(describing: "Обороты").capitalized
            self.title = title
            guard let obototsVC = self.storyboard?.instantiateViewController(withIdentifier: "obotots") else { return }
            self.view.addSubview(obototsVC.view)
            self.topView = obototsVC.view
            addChild(obototsVC)
        case .info:
            let title = String(describing: "Информаци").capitalized
            self.title = title
            guard let infoVC = self.storyboard?.instantiateViewController(withIdentifier: "info") else { return }
            self.view.addSubview(infoVC.view)
            self.topView = infoVC.view
            addChild(infoVC)
        case .settings:
            let title = String(describing: "Настройки").capitalized
            self.title = title
            guard let settingsVC = self.storyboard?.instantiateViewController(withIdentifier: "settings") else { return }
            self.view.addSubview(settingsVC.view)
            self.topView = settingsVC.view
            addChild(settingsVC)
        case .news:
            let title = String(describing: "Новости").capitalized
            self.title = title
            guard let newsVC = self.storyboard?.instantiateViewController(withIdentifier: "news") else { return }
            self.view.addSubview(newsVC.view)
            self.topView = newsVC.view
            addChild(newsVC)
        default:
            break
        }
    }

}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}

