//
//  DevServerAddrViewController.m
//  reactDemo
//
//  Created by 洪敬军 on 16/6/24.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "DevServerAddrViewController.h"
#import "QRCodeReaderViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface DevServerAddrViewController() <QRCodeReaderDelegate>

@end

@implementation DevServerAddrViewController

-(void)viewDidLoad {
  
  [self.view addSubview: self.urlTextField];
  [self.view addSubview: self.qrScanButton];
  [self.view addSubview: self.cancelButton];
  [self.view addSubview: self.okButton];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.urlTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"RCT_SERVER_ADDR_URL"] ? : @"";
}


-(UITextField *)urlTextField {
  if (_urlTextField == nil) {
    
    CGRect rect = CGRectMake(10, 200, SCREEN_WIDTH-20, 40);
    
    _urlTextField = [[UITextField alloc] initWithFrame: rect];
    _urlTextField.borderStyle = UITextBorderStyleRoundedRect;
    _urlTextField.placeholder = @"Input URL manual";
//    _urlTextField.backgroundColor = [UIColor redColor];
  }
  
  return _urlTextField;
}

-(UIButton *)qrScanButton {
  if (_qrScanButton == nil) {
    
    _qrScanButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    CGRect rect = CGRectMake(10, 300, SCREEN_WIDTH-20, 40);
    _qrScanButton.frame = rect;
    _qrScanButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [_qrScanButton setTitle:@"Input URL With QRScan" forState:UIControlStateNormal];
    [_qrScanButton addTarget:self action:@selector(qrAction:) forControlEvents:UIControlEventTouchUpInside];

  }
  
  return _qrScanButton;
}

-(UIButton *)cancelButton {
  if (_cancelButton == nil) {

    _cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    CGRect rect = CGRectMake(SCREEN_WIDTH-10-80, SCREEN_HEIGHT-40-40, 80, 40);
    _cancelButton.frame = rect;
    _cancelButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [_cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
  }
  
  return _cancelButton;
}

-(UIButton *)okButton {
  if (_okButton == nil) {
    
    _okButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    CGRect rect = CGRectMake(10, SCREEN_HEIGHT-40-40, 80, 40);
    _okButton.frame = rect;
    _okButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [_okButton setTitle:@"OK" forState:UIControlStateNormal];
    [_okButton addTarget:self action:@selector(okAction:) forControlEvents:UIControlEventTouchUpInside];
  }
  
  return _okButton;
}

-(IBAction)okAction:(id)sender {
  
  NSString *url = [_urlTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
  
  [[NSUserDefaults standardUserDefaults] setObject:url forKey:@"RCT_SERVER_ADDR_URL"];
  [[NSUserDefaults standardUserDefaults] synchronize];
  
  [self dismissViewControllerAnimated:YES completion:^{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RCTReloadNotification"
                                                        object:nil
                                                      userInfo:nil];
  }];
}

-(IBAction)cancelAction:(id)sender {
  
  [self dismissViewControllerAnimated:YES completion:^{
    
  }];
}

-(IBAction)qrAction:(id)sender {
  
  // Create the reader object
  QRCodeReader *reader = [QRCodeReader readerWithMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
  
  // Instantiate the view controller
  QRCodeReaderViewController *vc = [QRCodeReaderViewController readerWithCancelButtonTitle:@"Cancel" codeReader:reader startScanningAtLoad:YES showSwitchCameraButton:YES showTorchButton:YES];
  
  // Set the presentation style
  vc.modalPresentationStyle = UIModalPresentationFormSheet;
  
  // Define the delegate receiver
  vc.delegate = self;
//  
//  // Or use blocks
//  [reader setCompletionWithBlock:^(NSString *resultAsString) {
//    NSLog(@"%@", resultAsString);
//  }];
  
  [self presentViewController:vc animated:YES completion:NULL];
}

#pragma mark - QRCodeReader Delegate Methods

- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result
{
  [self dismissViewControllerAnimated:YES completion:^{
    _urlTextField.text = result;
  }];
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader
{
  [self dismissViewControllerAnimated:YES completion:NULL];
}



@end
