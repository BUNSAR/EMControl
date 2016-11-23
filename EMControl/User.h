//
//  User.h
//  Kampus
//
//  Created by Gokhan Orun on 9/30/14.
//  Copyright (c) 2014 GO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> 

@interface User : NSObject

+ (void) uploadImage:(void (^)(NSString *error, NSMutableArray *results, NSString *file_name)) block:(UIImage *) photo: (NSString *) autodetect;

+ (void) getMatches:(void (^)(NSArray *results, NSString *error)) block : (NSString *) filename : (NSString *) gender: (CGRect *) crop_area;
@end
