//
//  File.swift
//  SLP
//
//  Created by 나리강 on 2022/11/17.
//

import Foundation

enum APIUrl {
    static let baseURL = "http://api.sesac.co.kr:1210"
    static let loginandSignUp = "/v1/user"
    static let withdrawURL = "/v1/user/withdraw"
    static let updateToken = "/v1/user/update_fcm_token"
    static let updateMypage = "/v1/user/update_fcm_token"
    static let findRequest = "/v1/queue"
    static let search = "/v1/queue/search"
    static let myQueueState = "/v1/queue/myQueueState"
    static let saveMyPage = "/v1/user/mypage"

}
