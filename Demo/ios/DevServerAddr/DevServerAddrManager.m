//
//  DevServerAddrManager.m
//  reactDemo
//
//  Created by 洪敬军 on 16/6/24.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "DevServerAddrManager.h"
#import "RCTBridge+Private.h"


#if RCT_DEV


@implementation DevServerAddrManager

@synthesize bridge = _bridge;


RCT_EXPORT_MODULE()


- (void)setBridge:(RCTBridge *)bridge {
  
  _bridge = bridge;
  
  if ([_bridge isKindOfClass:[RCTBatchedBridge class]]) {
    
    RCTBatchedBridge *batched = (RCTBatchedBridge *)_bridge;
    [batched.parentBridge setValue:self forKey:@"delegate"];
  } else {
    
    [_bridge setValue:self forKey:@"delegate"];
  }
}

-(instancetype)init {
  
  self = [super init];
  if (self) {
    
  }
  
  return self;
}

#pragma mark - RCTBridgeDelegate

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge {
  
  NSURL *serverUrl = nil;
  NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:@"RCT_SERVER_ADDR_URL"];
  if (url != nil && url.length > 1) {
    
    serverUrl = [NSURL URLWithString: url];
  }
  
  return serverUrl;
}


@end

#endif