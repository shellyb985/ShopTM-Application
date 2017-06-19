//
//  ScanViewController.m
//  ShopTM Application
//
//  Created by Shelly Pritchard on 17/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import "ScanViewController.h"

@interface ScanViewController () {
    CGFloat height;
    CGFloat yPoint;
}

@end


@implementation ScanViewController
@synthesize videoPreviewLayer;
@synthesize captureSession;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self startReading];
    [self.view updateConstraintsIfNeeded];
    [self.view layoutIfNeeded];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    height = self.movingViewYpointConstrain.constant;
    yPoint = self.movingView.frame.origin.y;
    
    self.movingViewYpointConstrain.constant = height;
    
    [self.view updateConstraintsIfNeeded];
    [self.view layoutIfNeeded];

    [self startMovingViewUp];
}

- (void)startMovingViewUp {

    self.movingViewYpointConstrain.constant = self.codePreview.frame.origin.y;
    [UIView animateWithDuration:3.0 animations:^{
        [self.view updateConstraintsIfNeeded];
        [self.view layoutIfNeeded];

    } completion:^(BOOL finished) {
        [self startMovingViewDown];
    }];

}

- (void)startMovingViewDown {
    
    self.movingViewYpointConstrain.constant = self.codePreview.frame.origin.y+self.codePreview.frame.size.height;
    [UIView animateWithDuration:3.0 animations:^{
        [self.view updateConstraintsIfNeeded];
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        [self startMovingViewUp];
    }];
    
}


- (BOOL)startReading {

    NSError *error;
    
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    if (!input) {
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
    captureSession = [[AVCaptureSession alloc] init];
    [captureSession addInput:input];
    
    AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [captureSession addOutput:captureMetadataOutput];
    
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("myQueue", NULL);
    [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    [captureMetadataOutput setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    
    videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:captureSession];
    [videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    //[_videoPreviewLayer setFrame:self.codePreview.layer.bounds];

    [self.codePreview.layer addSublayer:videoPreviewLayer];
    
    
//    NSDictionary *dictionary = NSDictionaryOfVariableBindings(videoPreviewLayer);
    
//    NSArray *horizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[videoPreviewLayer]-0-|" options:0 metrics:@{} views:dictionary];
//    NSArray *vertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[videoPreviewLayer]-0-|" options:0 metrics:@{} views:dictionary];
    
//    [self.view addConstraints:horizontal];
//    [self.view  addConstraints:vertical];

    
    
    
    [captureSession startRunning];
    
    return YES;
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    // you need to store a reference to the gradient layer and gradient views or fetch them from the sublayers and subviews
    videoPreviewLayer.frame = self.codePreview.bounds;
    [self.view updateConstraintsIfNeeded];
    [self.view layoutIfNeeded];
    
    self.view.layer.zPosition = 2;
    [self.view bringSubviewToFront:self.movingView];
}


-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode]) {
           // [_lblStatus performSelectorOnMainThread:@selector(setText:) withObject:[metadataObj stringValue] waitUntilDone:NO];
            
            [self performSelectorOnMainThread:@selector(stopReading) withObject:nil waitUntilDone:NO];
            //[_bbitemStart performSelectorOnMainThread:@selector(setTitle:) withObject:@"Start!" waitUntilDone:NO];
            //_isReading = NO;
        }
    }
}


@end
