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
        
        NSLog(@"width:%d, height:%d", self.width, self.height);
        
        self.html = [NSString stringWithFormat:@"<center><img style='width:100&#037;' src='%@' /></center>",self.url.description];
    }
    return self;
}

@end
