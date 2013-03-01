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

@synthesize url;
@synthesize duration;
@synthesize image;
@synthesize data;
@synthesize height;
@synthesize width;


-(id)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.url = [NSURL URLWithString:[dict objectForKey:@"url"]];
        self.height = [[dict objectForKey:@"y"] intValue];
        self.width = [[dict objectForKey:@"x"] intValue];
            //self.duration = [[dict objectForKey:@"duration"] floatValue];
            //self.data = [NSData dataWithContentsOfURL:self.url];
            //self.image = [UIImage animatedImageWithAnimatedGIFData:self.data duration:self.duration];
    }
    return self;
}

@end
