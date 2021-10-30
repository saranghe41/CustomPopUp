//
//  PopUp.swift
//  CustomPopUp
//
//  Created by 김지은 on 2021/10/29.
//

import Foundation
import UIKit

class CustomPopUpViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var subscribBtn: UIButton!
    @IBOutlet weak var openChatBtn: UIButton!
    @IBOutlet weak var bgBtn: UIButton!
    @IBOutlet weak var myImg: UIImageView!
    
    var subscribBtnCompletionClosure: (() -> Void)? // ()-> Void: 아무행위도 하지않는다
    
    var popupDelegate: PopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController - viewDidLoad() called")
        
        contentView.layer.cornerRadius = 30
        subscribBtn.layer.cornerRadius = 10
        openChatBtn.layer.cornerRadius = 10
        myImg.layer.cornerRadius = 40
    }
    
    // MARK: - IBActions
    @IBAction func onBgBtnClicked(_ sender: Any) {
        print("CustomPopUpViewController - onBgBtnClicked() called")
        
        // 현재창 닫기
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSubScribBtnClicked(_ sender: Any) {
        print("CustomPopUpViewController - onSubScribBtnClicked() called")
        
        // 현재창 닫기
        self.dismiss(animated: true, completion: nil)
        
        // 컴플레션 블럭 호출
        if let subscribBtnCompletionClosure = subscribBtnCompletionClosure {
            // 메인에 알림
            subscribBtnCompletionClosure()
        }
    }
  
    @IBAction func onOpenChatBtnClicked(_ sender: Any) {
        print("CustomPopUpViewController - onOpenChatBtnClicked() called")
        
        self.dismiss(animated: true, completion: nil)
        
        popupDelegate?.onOpenChatBtnClicked()
    }
}
