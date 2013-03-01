//
//  GMImage.m
//  Gif of the Magi
//
//  Created by Cameron Ehrlich on 2/4/13.
//  Copyright (c) 2013 Cameron Ehrlich. All rights reserved.
//

#import "GMImage.h"

@implementation GMImage

@synthesize url;
@synthesize height;
@synthesize width;
@synthesize html;

-(id)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.url = [NSURL URLWithString:[dict objectForKey:@"url"]];
        self.height = [[dict objectForKey:@"y"] intValue];
        self.width = [[dict objectForKey:@"x"] intValue];
        self.html = [NSString stringWithFormat:@"<img src='%@' />",self.url.description];
    }
    return self;
}

@end
