//
//  User.m
//  Kampus
//
//  Created by Gokhan Orun on 9/30/14.
//  Copyright (c) 2014 GO. All rights reserved.
//

#import "User.h"
#import "AFAppDotNetAPIClient.h"
#import "AFImageRequestOperation.h"
#import "BoundingBox.h"

@implementation User

+ (void) uploadImage:(void (^)(NSString *error, NSMutableArray *results, NSString *file_name)) block:(UIImage *) photo: (NSString *) autodetect  {
    @try{
        autodetect = @"1";
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters setObject:autodetect forKey:@"autodetect"];
        [parameters setObject:@"2" forKey:@"device_type"];
        [parameters setObject:@"damacana" forKey:@"device_model"];
        
        AFHTTPClient *client= [AFAppDotNetAPIClient sharedClient];
        NSURLRequest *request = [client multipartFormRequestWithMethod:@"POST" path:@"apiV2/uploadImage" parameters:parameters constructingBodyWithBlock: ^(id <AFMultipartFormData> formData) {
            [formData appendPartWithFileData:UIImageJPEGRepresentation(photo, 0.6) name:@"image" fileName:@"file.jpg" mimeType:@"image/jpeg"];
        }];
        
        AFHTTPRequestOperation *operation = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id json_returned) {
            NSLog(@"uploadPhotoBlock success with JSON : %@", json_returned);
            @try {
                int success = [[json_returned valueForKeyPath:@"success"] intValue];
                if (success == 1) {
                    NSArray *arr_results = [json_returned valueForKeyPath:@"results"];
                    NSString *filename = [json_returned valueForKeyPath:@"filename"];
                    NSMutableArray *results = [NSMutableArray arrayWithCapacity:[arr_results count]];
                    
                    for (NSDictionary *dict_result in arr_results) {
                        BoundingBox *b = [[BoundingBox alloc] init];
                        NSString *bounding_box = [dict_result valueForKeyPath:@"boundingBox"];
                        bounding_box = [bounding_box stringByReplacingOccurrencesOfString:@" " withString:@""];
                        NSArray *coord_arr = [bounding_box componentsSeparatedByString:@","];
                        
                        int x1 = [[coord_arr objectAtIndex:0] intValue];
                        int y1 = [[coord_arr objectAtIndex:1] intValue];
                        int x2 = [[coord_arr objectAtIndex:2] intValue];
                        int y2 = [[coord_arr objectAtIndex:3] intValue];
                        
                        int  width =  x2 - x1;
                        int  height = y2 - y1;
                        
                        b.x = x1;
                        b.y = y1;
                        b.width = width;
                        b.height = height;
                        
                        [results addObject:b];
                    }
                    
                    block(nil, results, filename);
                } else {
                    NSString *err_message = [json_returned valueForKeyPath:@"errorDesc"];
                    block(err_message, nil, nil);
                }
            } @catch (NSException *exception) {
                NSLog(@"%@ Exception in success: %@", @"post", exception.description);
                block(@"bilinmeyen hata", nil, nil);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@ failure : %@", @"post", error.description);
            block(error.description, nil, nil);
        }];
        
        [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
            NSLog(@"Sent %lld of %lld bytes", totalBytesWritten, totalBytesExpectedToWrite);
        }];
        
        [client enqueueHTTPRequestOperation:operation];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception uploadPhotoBlock: %@", exception.description);
    }
}

+ (void) getMatches:(void (^)(NSArray *results, NSString *error)) block : (NSString *) filename : (NSString *) gender: (CGRect *) crop_area {
    @try {
        NSString *crop_area_str = [NSString stringWithFormat:@"%d,%d,%d,%d",
                                    (NSInteger) crop_area->origin.x,
                                   (NSInteger) crop_area->origin.y,
                                   (NSInteger) (crop_area->origin.x + crop_area->size.width),
                                   (NSInteger) (crop_area->origin.y + crop_area->size.height)];
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters setObject:filename forKey:@"filename"];
        [parameters setObject:@"1" forKey:@"debug"];
        [parameters setObject:([gender isEqualToString:@"male"] ? @"m" : @"f") forKey:@"gender"];
        [parameters setObject:@"0" forKey:@"segmentify"];
        [parameters setObject:crop_area_str forKey:@"crop"];
        
        [[AFAppDotNetAPIClient sharedClient] getPath:@"/apiV2/search" parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id json_returned) {
             NSLog(@"success with JSON : %@", json_returned);
             @try {
                 int success = [[json_returned valueForKeyPath:@"success"] intValue];
                 if (success == 1) {
                     NSArray *arr_results = [json_returned valueForKeyPath:@"results"];
                     
                     block([NSArray array], nil);
                 } else {
                     NSString *err_msg = [json_returned valueForKeyPath:@"errorDesc"];
                     block(nil, err_msg);
                 }
             }
             @catch (NSException *exception) {
                 NSLog(@"Exception in success: %@", exception.description);
                 block([NSArray array], nil);
             }
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             block([NSArray array], @"Hayırdır internetin yok?");
         }];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception.description);
    }
}

@end
