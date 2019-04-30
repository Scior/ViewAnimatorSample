//
//  AnimationExecutor.swift
//  ViewAnimatorSample
//
//  Created by Suita Fujino on 2019/04/30.
//  Copyright © 2019 Suita Fujino. All rights reserved.
//

import UIKit

final class AnimationBuilder {
    var delay: TimeInterval? = nil
    var options: UIView.AnimationOptions? = nil
    let resolvingAnimation: ResolvingAnimation?
    
    init(resolvingAnimation: ResolvingAnimation?) {
        self.resolvingAnimation = resolvingAnimation
    }
    
    func delay(_ value: TimeInterval) -> AnimationBuilder {
        delay = value
        return self
    }
    
    func duration(_ value: TimeInterval) -> AnimationExecutor {
        return AnimationExecutor(resolvingAnimation: resolvingAnimation, duration: value, delay: delay, options: options)
    }
    
    func options(_ value: UIView.AnimationOptions) -> AnimationBuilder {
        options = value
        return self
    }
    
    func resolve() {
        resolvingAnimation?({})
    }
}
