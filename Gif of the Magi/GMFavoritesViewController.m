//
//  GMFavoritesViewController.m
//  Gif of the Magi
//
//  Created by Cameron Ehrlich on 3/2/13.
//  Copyright (c) 2013 Cameron Ehrlich. All rights reserved.
//

#import "GMFavoritesViewController.h"

@interface GMFavoritesViewController ()

@end

@implementation GMFavoritesViewController

@synthesize carousel;
@synthesize model;
@synthesize backButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    model = [Model sharedModel];
    
    carousel.type = iCarouselTypeRotary;
    carousel.scrollSpeed = 0.5f;
    carousel.decelerationRate = 0.5f;
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    
    [carousel reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
        [backButton setHidden:YES];
    }else{
        [backButton setHidden:NO];
    }
    return YES;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    NSLog(@"num of favs: %d",[model.favorites count]);
    return [model.favorites count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view {
    
    int width = [[UIScreen mainScreen] bounds].size.width-15;
    
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    [view.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [view.layer setShadowOffset:CGSizeMake(1, 1)];
    [view.layer setShadowOpacity:1];
    [view.layer setShadowRadius:10];
    [view.layer setShadowPath:CGPathCreateWithRect(view.frame, nil)];
    [view setClipsToBounds:NO];
    
    
    UIWebView *webview = [[UIWebView alloc] initWithFrame:view.bounds];
    [webview setUserInteractionEnabled:NO];
    [webview setScalesPageToFit:YES];
    [webview loadHTMLString:[[model.favorites objectAtIndex:index] html] baseURL:nil];
    [view addSubview:webview];
    
    return view;
}

-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    
    [[[UIAlertView alloc] initWithTitle:@"What would you like to do?" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Copy to Clipboard", @"Delete",nil] show];
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [self copyToClipboard:[carousel currentItemIndex]];
    }else if (buttonIndex == 2){
        [carousel removeItemAtIndex:[carousel currentItemIndex] animated:YES];
        [model removeItemFromFavoritesAtIndex:[carousel currentItemIndex]];
    }
}


-(NSData *)getGifDataFromUr:(NSURL*)url{
    return [NSData dataWithContentsOfURL:url];
}

-(void)copyToClipboard:(int)index{
    [[UIPasteboard generalPasteboard] setData:[self getGifDataFromUr:[[model.favorites objectAtIndex:index] url]] forPasteboardType:@"com.compuserve.gif"];
}

-(IBAction)next:(id)sender{
    [carousel scrollToItemAtIndex:[carousel currentItemIndex]+1 animated:YES];
}

-(IBAction)previous:(id)sender{
    [carousel scrollToItemAtIndex:[carousel currentItemIndex]-1 animated:YES];
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
            //nothing
    }];
}
@end
