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
#import <PluginAProtocol/PluginAProtocol.h>

@interface PluginAService () <PluginAProtocol>

@end

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

- (UIViewController *)mainViewController
{
    PAMainViewController *main = [[PAMainViewController alloc] init];
    return main;
}


@end
