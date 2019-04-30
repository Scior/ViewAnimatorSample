//
//  ViewAnimator.swift
//  ViewAnimatorSample
//
//  Created by Suita Fujino on 2019/04/30.
//  Copyright © 2019 Suita Fujino. All rights reserved.
//

typealias AnimationHandler = () -> Void
typealias ResolvingAnimation = (@escaping AnimationHandler) -> Void

final class ViewAnimator {
    static func start() -> AnimationBuilder {
        return AnimationBuilder(resolvingAnimation: nil)
    }
}
