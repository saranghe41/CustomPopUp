//
//  ViewController.swift
//  CustomPopUp
//
//  Created by 김지은 on 2021/10/29.
//

import UIKit
import WebKit

class ViewController: UIViewController, PopUpDelegate {
    
    @IBOutlet weak var popupBtn: UIButton!
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let bagicURL = URL(string: "http://www.naver.com")
        myWebView.load(URLRequest(url: bagicURL!))
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

