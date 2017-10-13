//
//  DevServerAddr.m
//  reactDemo
//
//  Created by 洪敬军 on 16/6/24.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "DevServerAddr.h"
#import "RCTDevMenu.h"
#import "RCTUtils.h"
#import "DevServerAddrViewController.h"
#import "UIViewController+Utils.h"

NSString * const ChangeServerAddrNotification = @"com.change.server.addr";

#if RCT_DEV
@implementation RCTDevMenu (serverAddr)


- (NSArray<RCTDevMenuItem *> *)newMenuItems {
  
  NSMutableArray<RCTDevMenuItem *> *items = (NSMutableArray *)[self newMenuItems];
  
  RCTDevMenuItem *item = [RCTDevMenuItem buttonItemWithTitle:@"Debug server host" handler:^{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:ChangeServerAddrNotification
                                                        object:nil
                                                      userInfo:nil];
    
  }];
  
  [items addObject: item];
  
  return items;
}

@end
#endif

@implementation DevServerAddr {
  
  DevServerAddrViewController *_serverAddrviewController;
}


+(void) load {
  
  RCTSwapInstanceMethods([RCTDevMenu class], @selector(_menuItemsToPresent), @selector(newMenuItems));
  
  static const DevServerAddr *_static_Dev_addr;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    
    _static_Dev_addr = [[DevServerAddr alloc] init];
  });
}


-(instancetype)init {
  
  self = [super init];
  if (self) {
    
    _serverAddrviewController = [[DevServerAddrViewController alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeServerAddr:) name:ChangeServerAddrNotification object:nil];
  }
  
  return self;
}


- (void)changeServerAddr:(NSNotification *)notification {
  
    UIViewController *controller = [UIViewController currentViewController];
    if (controller == nil) {
        return ;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([controller isKindOfClass: [UINavigationController class]]) {
            
            [controller presentViewController:_serverAddrviewController animated:YES completion:^{
                NSLog(@"");
            }];
        }
    });
  
}

-(void)dealloc {
  
  [[NSNotificationCenter defaultCenter] removeObserver: self];
}


@end
