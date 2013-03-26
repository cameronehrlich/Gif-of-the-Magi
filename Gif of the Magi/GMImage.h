//
//  GMImage.h
//  Gif of the Magi
//
//  Created by Cameron Ehrlich on 2/4/13.
//  Copyright (c) 2013 Cameron Ehrlich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMImage : NSObject

@property (nonatomic, strong) NSData *imageData;
@property (nonatomic, strong) UIImage *image;

- (id)  init;
- (id)  initWithURLString:(NSString *)str;

@end

