//
//  GMCarouselViewController.h
//  Gif of the Magi
//
//  Created by Cameron Ehrlich on 3/1/13.
//  Copyright (c) 2013 Cameron Ehrlich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "iCarousel.h"

@interface GMCarouselViewController : UIViewController <iCarouselDataSource, iCarouselDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) Model *model;
@property (strong, nonatomic) IBOutlet iCarousel *carousel;
- (IBAction)goToFavorites:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *favoriteButton;

@end
