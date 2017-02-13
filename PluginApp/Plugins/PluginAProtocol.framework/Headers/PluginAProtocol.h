//
//  PluginAProtocol.h
//  PluginAProtocol
//
//  Created by xxw on 2017/2/13.
//  Copyright © 2017年 xxw. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for PluginAProtocol.
FOUNDATION_EXPORT double PluginAProtocolVersionNumber;

//! Project version string for PluginAProtocol.
FOUNDATION_EXPORT const unsigned char PluginAProtocolVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <PluginAProtocol/PublicHeader.h>

// 头文件
#import <PluginLoader/PluginLoader.h>


// 接口定义
@protocol PluginAProtocol <PLPluginProtocol>

- (UIViewController *)mainViewController;

@end
