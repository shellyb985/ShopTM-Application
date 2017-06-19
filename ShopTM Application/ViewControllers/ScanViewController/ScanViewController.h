//
//  ScanViewController.h
//  ShopTM Application
//
//  Created by Shelly Pritchard on 17/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ScanViewController : UIViewController<AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (weak, nonatomic) IBOutlet UIView *codePreview;
@property (weak, nonatomic) IBOutlet UIView *movingView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *movingViewYpointConstrain;




@end
