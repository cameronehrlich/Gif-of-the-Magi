//
//  Model.h
//  Stitch It
//
//  Created by Cameron Ehrlich on 12/16/12.
//  Copyright (c) 2012 Stitch It. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMImage.h"

@interface Model : NSObject

@property (strong, nonatomic) NSMutableArray *images;
@property (strong, nonatomic) NSMutableArray *favorites;

+ (id)sharedModel;

-(void)addToFavorites:(GMImage *)url;
-(void)removeItemFromFavoritesAtIndex:(int)index;

@end
