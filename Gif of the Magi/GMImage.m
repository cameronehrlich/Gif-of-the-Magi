//
//  GMImage.m
//  Gif of the Magi
//
//  Created by Cameron Ehrlich on 2/4/13.
//  Copyright (c) 2013 Cameron Ehrlich. All rights reserved.
//

#import "GMImage.h"
#import "UIImage+animatedGIF.h"


@implementation GMImage

@synthesize imageData;
@synthesize image;

- (id)init
{
    self = [super init];
    if (self) {
        self.image = [UIImage imageNamed:@"placeholder.png"];
    }
    return self;
}

- (id)initWithURLString:(NSString *)str
{
    self = [super init];
    if (self) {
//        self.imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:str]];
        self.image = [UIImage animatedImageWithAnimatedGIFURL:[NSURL URLWithString:str]];
    }
    return self;
}




@end
