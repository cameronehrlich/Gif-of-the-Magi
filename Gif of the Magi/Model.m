//
//  Model.m
//  Stitch It
//
//  Created by Cameron Ehrlich on 12/16/12.
//  Copyright (c) 2012 Stitch It. All rights reserved.
//

#import "Model.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <dispatch/dispatch.h>
#import <Foundation/Foundation.h>
#import "GMImage.h"

@implementation Model

@synthesize images;
@synthesize favorites;


static Model *modelSingleton = nil;

- (id)init {
    if (self = [super init]) {
        NSURL *url = [NSURL URLWithString:@"http://www.graphative.com/gifs/index.php"];
        
        NSData *jsonData = [NSData dataWithContentsOfURL:url];
        
        NSError *e = nil;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options: NSJSONReadingMutableContainers error: &e];
        
        images = [[NSMutableArray alloc] init];
        
        for(NSDictionary *item in jsonArray) {
            GMImage *newImg = [[GMImage alloc] initWithDictionary:item];
            [images addObject:newImg];
        }
        
        favorites = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"favorites"]]];
    }
    return self;
}


+ (id)sharedModel {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        modelSingleton = [[self alloc] init];
    });
    return modelSingleton;
}


-(void)addToFavorites:(GMImage *)img{
    [favorites addObject:img];
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:favorites] forKey:@"favorites"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)removeItemFromFavoritesAtIndex:(int)index{
    [self.favorites removeObjectAtIndex:index];
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:favorites] forKey:@"favorites"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

@end