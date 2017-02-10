//
//  PluginAService.m
//  PluginA
//
//  Created by xxw on 2017/2/10.
//  Copyright © 2017年 xxw. All rights reserved.
//

#import "PluginAService.h"
#import "PAMainViewController.h"

__attribute__((constructor))

static void initializer(int argc, char** argv, char** envp)

{
    NSLog(@"init plugin: %@", [PluginAService name]);
}

@implementation PluginAService

+ (NSString *)name
{
    return @"PluginA";
}

+ (NSBundle *)bundle
{
    NSString *mainBundlePath = [[NSBundle mainBundle] resourcePath];
    NSString *frameworkBundlePath = [mainBundlePath stringByAppendingPathComponent:@"PluginA.bundle"];
    NSBundle *frameworkBundle = [NSBundle bundleWithPath:frameworkBundlePath];
    return frameworkBundle;
}

+ (UIViewController *)mainViewController
{
    PAMainViewController *main = [[PAMainViewController alloc] init];
    return main;
}


@end
