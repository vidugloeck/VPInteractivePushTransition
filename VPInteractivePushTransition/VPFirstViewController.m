//
//  VPPresentingViewController.m
//  ModalViewControllerTransitions
//
//  Created by Vidu Pirathaparajah on 06/11/13.
//
//

#import "VPFirstViewController.h"
#import "VPSecondViewController.h"

@interface VPFirstViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation VPFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	[self setupImageView];
    [self setupPushGestureRecognizer];
}

- (void)setupImageView {
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"presenting"]];
    self.imageView.frame = self.view.bounds;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageView];
}

- (void)setupPushGestureRecognizer {
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(pushGestureRecognizerTapped:)];
    [self.view addGestureRecognizer:gestureRecognizer];
}

- (void)pushGestureRecognizerTapped:(UITapGestureRecognizer *)gestureRecognizer {
    VPSecondViewController *secondViewController = [[VPSecondViewController alloc] initWithNibName:nil
                                                                                         bundle:nil];

    [self.navigationController pushViewController:secondViewController animated:YES];
}

@end
