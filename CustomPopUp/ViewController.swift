//
//  ViewController.swift
//  CustomPopUp
//
//  Created by 김지은 on 2021/10/29.
//

import UIKit
import WebKit

let notificationName = "btnClickNotification"

class ViewController: UIViewController, PopUpDelegate {
    
    @IBOutlet weak var popupBtn: UIButton!
    @IBOutlet weak var myWebView: WKWebView!
    
    // 노티피케이션 옵저버를 띄우고나서 프로그램 종료시 제거를 해줘야한다.
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let bagicURL = URL(string: "http://www.naver.com")
        myWebView.load(URLRequest(url: bagicURL!))
        
        // 노티피케이션이라는 방송 수신기를 장착한다.
        NotificationCenter.default.addObserver(self, selector: #selector(loadWebView), name: Notification.Name(rawValue: "btnClickNotification"), object: nil)
    }
    
    @objc fileprivate func loadWebView() {
        print("ViewController - loadWebView() called")

        let myGoogleURL = URL(string: "https://www.google.com")
        self.myWebView.load(URLRequest(url: myGoogleURL!))
    }
    
    @IBAction func onPopupBtnClicked(_ sender: Any) {
        print("ViewController - onPopupBtnClicked() called")
        
        // 스토리보드 가져오기
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        
        // 스토리보드를 통해 뷰컨트롤러 가져오기
        let customPopUpVC = storyboard.instantiateViewController(withIdentifier: "AlertPopUpVC") as! CustomPopUpViewController
        
        // 뷰컨트롤러가 보여지는 스타일
        customPopUpVC.modalPresentationStyle = .overCurrentContext
        
        // 뷰컨트롤러가 사라지는 스타일
        customPopUpVC.modalTransitionStyle = .crossDissolve // 스르르 사라지는 스타일
        
        customPopUpVC.subscribBtnCompletionClosure = {
            print("컴플레션 블럭이 호출되었다.")
            
            let myChannelUrl = URL(string: "https://github.com/saranghe41")
            self.myWebView.load(URLRequest(url: myChannelUrl!))
        }
        
        customPopUpVC.popupDelegate = self
        
        // present : 현재 viewcontroller에서 다른 viewcontroller를 보여주는 기능
        self.present(customPopUpVC, animated: true, completion: nil) // comletion: 보여주고나서 처리할것인가에 대한 설정
    }
    
    // MARK: - PopUpDelegate methods
    func onOpenChatBtnClicked() {
        print("ViewController - onOpenChatBtnClicked() called")

        let myOpenChatURL = URL(string: "https://www.youtube.com/channel/UCutO2H_AVmWHbzvE92rpxjA")
        self.myWebView.load(URLRequest(url: myOpenChatURL!))
    }
}

