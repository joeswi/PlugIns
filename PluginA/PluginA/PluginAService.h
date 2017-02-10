//
//  PluginAService.h
//  PluginA
//
//  Created by xxw on 2017/2/10.
//  Copyright © 2017年 xxw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PluginAServiceProtocal <NSObject>

+ (NSString *)name;

+ (NSBundle *)bundle;

+ (UIViewController *)mainViewController;

@end

@interface PluginAService : NSObject <PluginAServiceProtocal>

@end
