//
//  GMFavoritesViewController.h
//  Gif of the Magi
//
//  Created by Cameron Ehrlich on 3/2/13.
//  Copyright (c) 2013 Cameron Ehrlich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "Model.h"
@interface GMFavoritesViewController : UIViewController <iCarouselDataSource, iCarouselDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) Model *model;
@property (strong, nonatomic) IBOutlet iCarousel *carousel;
- (IBAction)goBack:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *backButton;

@end
