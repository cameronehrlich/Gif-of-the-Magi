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
@synthesize html;

-(id)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.url = [NSURL URLWithString:[dict objectForKey:@"url"]];
        self.html = [self generateHTML:url.description];
    }
    return self;
}

-(NSString *)generateHTML:(NSString *)theURL{
    
    NSString *tmpHTML = [NSString stringWithFormat:@"<div style='width:100%%;height:100%%;text-align:center;background-color:#000000;'><img style='width:95%%;position:absolute;margin:auto;top:0;left:0;right:0;bottom:0;' src='%@' /></div>",theURL];
    return tmpHTML;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
        //Encode properties, other class variables, etc
    [encoder encodeObject:self.url forKey:@"url"];
    [encoder encodeObject:self.html forKey:@"html"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
            //decode properties, other class vars
        self.url = [decoder decodeObjectForKey:@"url"];
        self.html = [decoder decodeObjectForKey:@"html"];
    }
    return self;
}

@end
