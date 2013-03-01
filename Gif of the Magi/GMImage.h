//
//  GMImage.h
//  Gif of the Magi
//
//  Created by Cameron Ehrlich on 2/4/13.
//  Copyright (c) 2013 Cameron Ehrlich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMImage : NSObject

@property (nonatomic, strong) NSURL *url;
@property (assign) float duration;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSData *data;
@property (nonatomic, strong) UIImageView *imageView;
@property (assign) int width;
@property (assign) int height;


-(id)initWithDictionary:(NSDictionary *)dict;

@end

