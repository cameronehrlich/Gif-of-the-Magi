//
//  Model.m
//  Stitch It
//
//  Created by Cameron Ehrlich on 12/16/12.
//  Copyright (c) 2012 Stitch It. All rights reserved.
//

#import "Model.h"
#import <Foundation/Foundation.h>
#import "GMImage.h"

static NSString *URL = @"http://aqueous-sea-9794.herokuapp.com/retrieve.json";
//static NSString *URL = @"http://cam.local:3000/retrieve.json";


@implementation Model{
@private
    NSOperationQueue *queue;
}

@synthesize images;

static Model *modelSingleton = nil;

+ (id)sharedModel {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        modelSingleton = [[self alloc] init];
    });
    return modelSingleton;
}

- (id)init {
    if (self = [super init]) {
        
        NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:URL]];
        
        NSError *e = nil;
        NSMutableArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options: NSJSONReadingMutableContainers error: &e];
        if (e) NSLog(@"%@",e.description);
        
        images = [[NSMutableArray alloc] init];
        queue = [[NSOperationQueue alloc] init];
        
        [queue setMaxConcurrentOperationCount:NSOperationQueueDefaultMaxConcurrentOperationCount];

        int count = 0;
        for(NSString *item in jsonArray) {
            if (count == 12) {break;}
            
            [queue addOperationWithBlock:^{
                GMImage *image = [[GMImage alloc] initWithURLString:item];
                [images replaceObjectAtIndex:count withObject:image];
                [self notifyWithNumber:count];
            }];
            
            [images addObject:[[GMImage alloc] init]];
            count++;
        }
    }
    return self;
}

-(void)notifyWithNumber:(int)num{
    dispatch_sync(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"newImage" object:[NSNumber numberWithInt:num]];
    });
}

@end