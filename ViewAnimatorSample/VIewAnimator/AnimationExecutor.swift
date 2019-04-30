//
//  AnimationExecutor.swift
//  ViewAnimatorSample
//
//  Created by Suita Fujino on 2019/04/30.
//  Copyright © 2019 Suita Fujino. All rights reserved.
//

import UIKit

final class AnimationExecutor {
    let resolvingAnimation: ResolvingAnimation?
    let delay: TimeInterval?
    let duration: TimeInterval
    var options: UIView.AnimationOptions? = nil
    
    init(resolvingAnimation: ResolvingAnimation?, duration: TimeInterval, delay: TimeInterval? = nil, options: UIView.AnimationOptions?) {
        self.resolvingAnimation = resolvingAnimation
        self.duration = duration
        self.delay = delay
        self.options = options
    }
    
    func animate(handler: @escaping AnimationHandler) -> AnimationBuilder {
        let resolving: (@escaping AnimationHandler) -> Void = { [duration, delay, options] completion in
            let animation = { UIView.animate(
                withDuration: duration,
                delay: delay ?? TimeInterval.zero,
                options: options ?? [],
                animations: handler,
                completion: { _ in completion() }
            )}
            
            if let resolvingAnimation = self.resolvingAnimation {
                resolvingAnimation(animation)
            } else {
                animation()
            }
        }
        return AnimationBuilder(resolvingAnimation: resolving)
    }

}
