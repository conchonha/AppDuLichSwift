//
//  Operaotors.swift
//  AppDulichSwift
//
//  Created by Sang on 19/06/2022.
//

import Foundation

import Foundation
import RxSwift
import RxCocoa

infix operator <->

func <-> <T>(property: ControlProperty<T?>, relay: BehaviorRelay<T?>) -> Disposable {
    let bindToUIDisposable = relay.bind(to: property)
    let bindToRelay = property
        .subscribe(onNext: { n in
            relay.accept(n)
        }, onCompleted:  {
            bindToUIDisposable.dispose()
        })

    return Disposables.create(bindToUIDisposable, bindToRelay)
}
