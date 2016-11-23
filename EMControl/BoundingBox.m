//
//  BoundingBox.m
//  Easy Match
//
//  Created by Gokhan Orun on 18/08/16.
//  Copyright © 2016 bunsar. All rights reserved.
//

#import "BoundingBox.h"

@implementation BoundingBox

-(id)initWithX:(CGFloat) x_ andY:(CGFloat) y_ andWidth:(CGFloat) width_ andHeight:(CGFloat) height_
{
    self = [super init];
    if (self) {
        self.x = x_;
        self.y = y_;
        self.width = width_;
        self.height = height_;
    }
    return self;
}

@end
