//
//  VPTransitionDelegate.m
//  VPInteractivePushTransition
//
//  Created by Vidu Pirathaparajah on 03/12/13.
//  Copyright (c) 2013 Vidu Pirathaparajah. All rights reserved.
//

#import "VPTransitionDelegate.h"
#import "VPTransitionAnimator.h"
#import "VPTransitionInteractor.h"

@interface VPTransitionDelegate ()
@property (nonatomic, strong) VPTransitionInteractor *transitionInteractor;
@end

@implementation VPTransitionDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        self.transitionInteractor = [[VPTransitionInteractor alloc] initWithViewController:toVC];
    }
    VPTransitionAnimator *transitionAnimator = [[VPTransitionAnimator alloc] init];
    transitionAnimator.operation = operation;
    return transitionAnimator;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if (self.transitionInteractor.isInteractiveTransition) {
        return self.transitionInteractor;
    }
    return nil;
}

@end
