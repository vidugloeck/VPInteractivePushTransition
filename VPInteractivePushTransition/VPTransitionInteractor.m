//
//  VPTransitionInteractor.m
//  VPInteractivePushTransition
//
//  Created by Vidu Pirathaparajah on 03/12/13.
//  Copyright (c) 2013 Vidu Pirathaparajah. All rights reserved.
//

#import "VPTransitionInteractor.h"

@interface VPTransitionInteractor ()
@property (nonatomic, weak) UIViewController *viewController;
@end

@implementation VPTransitionInteractor

- (id)initWithViewController:(UIViewController *)viewController {
    self = [super init];
    if (self) {
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                               action:@selector(panDetected:)];
        _viewController = viewController;
        [_viewController.view addGestureRecognizer:panGestureRecognizer];
    }
    return self;
}


- (void)panDetected:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint translation = [gestureRecognizer translationInView:self.viewController.view];
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            self.isInteractiveTransition = YES;
            [self.viewController.navigationController popViewControllerAnimated:YES];
            break;
        case UIGestureRecognizerStateChanged:
            if (self.isInteractiveTransition) {
                [self updateInteractiveTransition:translation.x / 100];
            }
            break;
        case UIGestureRecognizerStateFailed:
            if (self.isInteractiveTransition) {
                [self cancelInteractiveTransition];
                self.isInteractiveTransition = NO;
            }
            break;
        case UIGestureRecognizerStateEnded:
            if (self.isInteractiveTransition) {
                if (translation.x > 50) {
                    [self finishInteractiveTransition];
                } else {
                    [self cancelInteractiveTransition];
                }
                self.isInteractiveTransition = NO;
            }
            break;
        default:
            break;
    }
}


@end
