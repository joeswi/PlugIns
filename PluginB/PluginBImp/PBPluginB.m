//
//  PBPluginB.m
//  PluginB
//
//  Created by xxw on 2017/2/10.
//  Copyright © 2017年 xxw. All rights reserved.
//

#import "PBPluginB.h"
#import <PluginB/PluginBProtocol.h>

@interface PBPluginB () <PluginBProtocol>

@end


@implementation PBPluginB

- (NSString *)name
{
    return @"PluginB";
}

- (void)sayHello
{
    NSLog(@"hello from %@", [self name]);
}

- (NSString *)version
{
    return @"1.0.0";
}

@end
