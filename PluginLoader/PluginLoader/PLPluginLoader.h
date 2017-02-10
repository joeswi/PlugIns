//
//  PluginLoader.h
//  PluginLoader
//
//  Created by xxw on 2017/2/10.
//  Copyright © 2017年 xxw. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for PluginLoader.
FOUNDATION_EXPORT double PluginLoaderVersionNumber;

//! Project version string for PluginLoader.
FOUNDATION_EXPORT const unsigned char PluginLoaderVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <PluginLoader/PublicHeader.h>

@protocol PluginProtocal <NSObject>

+ (NSString *)name;

+ (NSString *)version;

@end


@interface PLPluginLoader : NSObject

+ (instancetype)defaultLoader;

- (id<PluginProtocal>)findPlugin:(NSString *)name;

- (void)registerPluginImplement:(id<PluginProtocal>)PluginImplement;

@end
