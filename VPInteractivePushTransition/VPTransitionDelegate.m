//
//  VPTransitionDelegate.m
//  VPInteractivePushTransition
//
//  Created by Vidu Pirathaparajah on 03/12/13.
//  Copyright (c) 2013 Vidu Pirathaparajah. All rights reserved.
//

#import "VPTransitionDelegate.h"
#import "VPTransitionAnimator.h"

@implementation VPTransitionDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    VPTransitionAnimator *transitionAnimator = [[VPTransitionAnimator alloc] init];
    transitionAnimator.operation = operation;
    return transitionAnimator;
}

@end
