//
//  CameraViewController.h
//  EMControl
//
//  Created by Gokhan Orun on 22/09/16.
//  Copyright © 2016 Bunsar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCropView.h"

@interface CameraViewController : UIViewController <UIImagePickerControllerDelegate, ImageCropViewControllerDelegate>

//@property (nonatomic, retain) IBOutlet UIButton *btnCamera;
@property(nonatomic) Boolean crop_enable;

@end
