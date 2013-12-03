//
//  VPTransitionInteractor.h
//  VPInteractivePushTransition
//
//  Created by Vidu Pirathaparajah on 03/12/13.
//  Copyright (c) 2013 Vidu Pirathaparajah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VPTransitionInteractor : UIPercentDrivenInteractiveTransition <UIViewControllerInteractiveTransitioning>

@property (nonatomic, assign) BOOL isInteractiveTransition;
- (id)initWithViewController:(UIViewController *)viewController;

@end
