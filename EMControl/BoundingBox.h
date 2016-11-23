//
//  BoundingBox.h
//  Easy Match
//
//  Created by Gokhan Orun on 18/08/16.
//  Copyright © 2016 bunsar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoundingBox : NSObject

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

-(id)initWithX:(CGFloat) x_ andY:(CGFloat) y_ andWidth:(CGFloat) width_ andHeight:(CGFloat) height_;

@end
