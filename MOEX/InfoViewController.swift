//
//  InfoViewController.swift
//  MOEX
//
//  Created by Артем Пивнев on 27.09.2021.
//

import UIKit
import MessageUI

class InfoViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        let mailComposeViewController = configureMailComposer()
        
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
        }
        else {
            print("Нет доступа к ICloud")
        }
        
    }
    
    func configureMailComposer() -> MFMailComposeViewController{
        let mailComposeVC = MFMailComposeViewController()
        
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(["email@email.com"])
        mailComposeVC.setSubject("Заголовок")
        mailComposeVC.setMessageBody("Тело", isHTML: false)
        
        return mailComposeVC
        
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
