# BUNSAR Easy Match SDK

![Screenshot](https://s3.amazonaws.com/whonear/tmp/bunsar_sdk.png "screenshot")

# EMControl

Easy Match Image Search Api iOS SDK

With Easy Match image search SDK you can easily make image search queries via Bunsar Image Search api.

# Installation

CocoaPods is the recommended method of installing RSKImageCropper. Simply add the following line to your Podfile:

# Podfile

pod 'EMControl', :git => 'https://github.com/GokhanOrun/EMControl', :tag => '1.0.0'

# Basic Usage

Import the class header.

```
#import <EMControl/EMControl.h>
```

Just create a CameraViewController and set the delegate.

```
-(void)btnCameraWithCropClick:(UIButton *)sender
{
    CameraViewController *camera = [[CameraViewController alloc] init];
    camera.crop_enable = true;
    camera.delegate = self;
    [self presentViewController:camera animated:YES completion:nil];
}
```

On CameraViewControllerSuccess delegate you'll get matched results.

```
- (void) CameraViewControllerSuccess:(UIViewController* )controller didFinishSearch: (NSMutableArray *) results {
    // use results array to show matched images
}
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

