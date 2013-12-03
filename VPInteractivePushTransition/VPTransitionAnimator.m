//
//  VPTransitionAnimator.m
//  VPInteractivePushTransition
//
//  Created by Vidu Pirathaparajah on 03/12/13.
//  Copyright (c) 2013 Vidu Pirathaparajah. All rights reserved.
//

#import "VPTransitionAnimator.h"

@implementation VPTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];

    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    CGRect endFrame = [transitionContext initialFrameForViewController:fromViewController];

    [containerView addSubview:fromViewController.view];
    [containerView addSubview:toViewController.view];

    fromViewController.view.frame = endFrame;
    toViewController.view.frame = endFrame;
    toViewController.view.alpha = 0.0f;

    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         toViewController.view.alpha = 1.0f;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];

                     }];
}

@end
