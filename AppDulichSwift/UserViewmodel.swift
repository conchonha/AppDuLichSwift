//
//  UserViewmodel.swift
//  AppDulichSwift
//
//  Created by Sang on 18/06/2022.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class UserViewModel : NSObject{
    let bag = DisposeBag()
    var searchInput = BehaviorRelay<String?>(value: "")
    var searchResult = BehaviorSubject<[UserModel]>(value: [])
    
    override init() {
        super.init()
        bindingData()
    }
    
    func bindingData(){
        self.searchInput.subscribe(onNext: {(str)->Void in
            print("SangTB: \(str!)")
            if ((str?.isEmpty) != nil){
                self.requestJson(str: "https://api.githup.com/search/users?q=\(str!)")
            }else{
                self.searchResult.onNext([])
            }
        }, onError: nil, onCompleted: nil).disposed(by: bag)
        
    }
    
    func requestJson(str: String){
//        let url = URL(string: "https://api.githup.com/search/users?q=\()")
        print("SangTB: co vao url: \(str)")
        let url = URL(string: str)
        let session = URLSession.shared
        session.dataTask(with: url!, completionHandler: { (data,res,err) in
            print("SangTB: data:\(data)")
            if(err == nil){
                do{
                    if let result : Dictionary<String,Any> =  try JSONSerialization.jsonObject(with: data!,options: JSONSerialization.ReadingOptions.allowFragments) as? Dictionary<String,Any>{
                        print("SangTB: result \(result) ")
                        if let items : Array<Any> = result["items"] as? Array<Any>{
                            var userArray : Array<UserModel> = []
                            for i in items{
                                let user = UserModel(object: i)
                                userArray.append(user)
                            }
                            self.searchResult.onNext(userArray)
                        }
                    }
                }catch{
                    
                }
            }
        })
    }
}
