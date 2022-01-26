//
//  socialLogin.swift
//  SJS-Project
//
//  Created by 정수범 on 2022/01/23.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKUser
import KakaoSDKAuth
import Alamofire

class SocialLoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func kakaoLoginButton(_ sender: Any) {
//        // 카카오톡 앱으로 로그인
//        if (UserApi.isKakaoTalkLoginAvailable()) {
//            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
//                if let error = error {
//                    print(error)
//                }
//                else {
//                    print("카카오톡 로그인 성공")
//
//                    _ = oauthToken
//                }
//            }
//        }
    
        // 웹으로 로그인
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("로그인 성공")
                
                _ = oauthToken
                
            }
        }
        
        // 사용자 정보 가져오기
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("정보 가져오기 성공")
                
                _ = user
            }
        }
        
        if (AuthApi.hasToken()) {
            UserApi.shared.accessTokenInfo { (_, error) in
                if let error = error {
                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true {
                        print("로그인 필요")
                    }
                    else {
                        print("기타 에러")
                    }
                }
                else {
                    print("토큰 유효성 체크 성공")
                }
            }
        }
        else {
            print("로그인 필요")
        }
    }
    
    
//    @IBAction func logout(_ sender: Any) {
//        UserApi.shared.logout {(error) in
//            if let error = error {
//                print(error)
//            }
//            else {
//                print("로그아웃 성공")
//            }
//        }
//    }
}
