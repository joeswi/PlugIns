//
//  PluginAService.m
//  PluginA
//
//  Created by xxw on 2017/2/10.
//  Copyright © 2017年 xxw. All rights reserved.
//

#import "PluginAService.h"
#import "PAMainViewController.h"
#import <PluginLoader/PluginLoader.h>

__attribute__((constructor))
static void initializer(int argc, char** argv, char** envp)
{
    PluginAService *pluginA = [PluginAService shareInstance];
    NSLog(@"init plugin: %@", [pluginA name]);
    [[PLPluginLoader defaultLoader] registerPlugin:pluginA];
}

@implementation PluginAService

+ (instancetype)shareInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}


- (NSString *)name
{
    return @"PluginA";
}

- (NSBundle *)bundle
{
    NSString *mainBundlePath = [[NSBundle mainBundle] resourcePath];
    NSString *frameworkBundlePath = [mainBundlePath stringByAppendingPathComponent:@"PluginA.bundle"];
    NSBundle *frameworkBundle = [NSBundle bundleWithPath:frameworkBundlePath];
    return frameworkBundle;
}

- (UIViewController *)mainViewController
{
    PAMainViewController *main = [[PAMainViewController alloc] init];
    return main;
}


@end
