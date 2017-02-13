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

@protocol PLPluginLoadable <NSObject>

@end

@protocol PLPluginProtocal <PLPluginLoadable>

- (NSString *)name;

- (NSString *)version;

@end


@interface PLPluginLoader : NSObject

+ (instancetype)defaultLoader;

- (void)loadPlugins:(NSArray *)plugins;

- (id<PLPluginProtocal>)findPlugin:(NSString *)name;

- (void)registerPlugin:(id<PLPluginProtocal>)plugin;

@end


@interface PLPluginBundle : NSObject

+ (NSBundle *)pluginBundle:(NSString *)name;

@end
