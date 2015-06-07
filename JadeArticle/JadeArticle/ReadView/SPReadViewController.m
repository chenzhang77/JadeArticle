//
//  SPReadViewController.m
//  JadeArticle
//
//  Created by Roselifeye on 15/6/4.
//  Copyright (c) 2015年 Roselifeye. All rights reserved.
//

#import "SPReadViewController.h"
#import "SPReadDetailViewController.h"
#import "SPMainViewController.h"

@interface SPReadViewController ()

@end

@implementation SPReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBeginView];
    [self initNavigationViewArray];
}

- (void)initNavigationViewArray {
    SPMainViewController *mainView = [self.storyboard instantiateViewControllerWithIdentifier:@"mainMenuVIew"];
    NSArray *viewArray = [NSArray arrayWithObjects:mainView, self, nil];
    self.navigationController.viewControllers = viewArray;
}

- (void)initBeginView {
    UIImage *bgImage = [UIImage imageNamed:@"LeftMenuBG"];
    self.view.layer.contents = (id) bgImage.CGImage;
    [self.navigationController setNavigationBarHidden:YES];
    
    [self curtainRevealViewFromView:[self createDoorViewWithBGImageName:@"MainMenuBG" andDoorknobImageName:@"doorknob"]
                  ToDestinationView:self.view
                   andLogoImageView:[self createDoorViewWithBGImageName:@"MainMenuBG" andDoorknobImageName:@"readDoorKnob"]
                    transitionStyle:SPCurtainTransitionHorizontal];
}

- (IBAction)beginReadBtnClicked:(id)sender {
    SPReadDetailViewController *readDetailView = [self.storyboard instantiateViewControllerWithIdentifier:@"readDetailView"];
    [self.navigationController pushViewController:readDetailView animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
