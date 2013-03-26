//
//  GMMainViewController.m
//  Gif of the Magi
//
//  Created by Cameron Ehrlich on 3/21/13.
//  Copyright (c) 2013 Cameron Ehrlich. All rights reserved.
//

#define edgeInset 7

#import "GMMainViewController.h"
#import "Model.h"

@implementation GMMainViewController{
@private
    Model *model;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    model = [Model sharedModel];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector( update: ) name:@"newImage" object:nil];
}

-(void)update:(NSNotification *) notification{
    
    int row = [[notification object] intValue];
    
    NSLog(@"recieved image number: %d", row);
    [self.collectionView performBatchUpdates:^{
        [self.collectionView reloadItemsAtIndexPaths:@[ [NSIndexPath indexPathForRow:row inSection:0] ]];
    } completion:^(BOOL finished) {
        //
    }];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"number of images: %d", model.images.count);
    return model.images.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIImageView *iView = [[UIImageView alloc] initWithFrame:cell.bounds];
        [iView setImage:[[model.images objectAtIndex:indexPath.row] image]];
        [cell setBackgroundView:iView];
    });
    
    return cell;
}

#pragma mark – UICollectionViewDelegateFlowLayout

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return [self getCellSize:indexPath];
}

- (UIEdgeInsets)collectionView: (UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0,edgeInset,0,edgeInset);
}


-(CGSize)getCellSize:(NSIndexPath *)indexPath{
    float width = [[UIScreen mainScreen] bounds].size.width;
    
    if (indexPath.row % 3 == 1 || indexPath.row % 3 == 2) {
        //small cells
        return CGSizeMake(width / 2.2, (width / 2.2) - ((width / 2.2)/3));
    }else{
        //big cells
        return CGSizeMake(width-edgeInset*2,(width-edgeInset*2)- (width/3));
    }
}


//-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
//
//    [[[UIAlertView alloc] initWithTitle:@"What would you like to do?" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Save to Favorites", @"Copy to Clipboard", nil] show];
//}
//
//
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (buttonIndex == 1) {
//        [self saveFavorites:[carousel currentItemIndex]];
//    }else if (buttonIndex == 2){
//        [self copyToClipboard:[carousel currentItemIndex]];
//    }
//}
//
//-(void)copyToClipboard:(int)index{
//    [[UIPasteboard generalPasteboard] setData:[self getGifDataFromUr:[[model.images objectAtIndex:index] url]] forPasteboardType:@"com.compuserve.gif"];
//}
//
//-(void)saveFavorites:(int)index{
//    [model addToFavorites:[[model images] objectAtIndex:index]];
//}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
