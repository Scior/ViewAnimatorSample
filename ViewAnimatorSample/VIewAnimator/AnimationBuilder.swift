//
//  AnimationExecutor.swift
//  ViewAnimatorSample
//
//  Created by Suita Fujino on 2019/04/30.
//  Copyright © 2019 Suita Fujino. All rights reserved.
//

import Foundation

final class AnimationBuilder {
    var delay: TimeInterval? = nil
    let resolvingAnimation: ResolvingAnimation?
    
    init(resolvingAnimation: ResolvingAnimation?) {
        self.resolvingAnimation = resolvingAnimation
    }
    
    func delay(_ value: TimeInterval) -> AnimationBuilder {
        delay = value
        return self
    }
    
    func duration(_ value: TimeInterval) -> AnimationExecutor {
        return AnimationExecutor(resolvingAnimation: resolvingAnimation, duration: value, delay: delay)
    }
    
    func resolve() {
        resolvingAnimation?({})
    }
}
