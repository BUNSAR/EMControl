//
//  CameraViewController.h
//  EMControl
//
//  Created by Gokhan Orun on 22/09/16.
//  Copyright © 2016 Bunsar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCropView.h"

/*
#pragma mark ImageCropViewController interface
@protocol CameraViewControllerDelegate <NSObject>

- (void) CameraViewControllerSuccess:(UIViewController* )controller didFinishSearch: (NSMutableArray *) results;

@end
*/

@interface CameraViewController : UIViewController <UIImagePickerControllerDelegate, ImageCropViewControllerDelegate>

//@property (nonatomic, weak) id<CameraViewControllerDelegate> delegate;
@property(nonatomic) Boolean crop_enable;

@end
