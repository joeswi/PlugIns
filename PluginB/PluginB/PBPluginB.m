//
//  PBPluginB.m
//  PluginB
//
//  Created by xxw on 2017/2/10.
//  Copyright © 2017年 xxw. All rights reserved.
//

#import "PBPluginB.h"

__attribute__((constructor))

static void initializer(int argc, char** argv, char** envp)
{
    NSLog(@"init plugin: %@", @"PluginB");
}


@implementation PBPluginB




@end
