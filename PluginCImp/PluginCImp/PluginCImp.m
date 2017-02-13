//
//  PluginCImp.m
//  PluginCImp
//
//  Created by xxw on 2017/2/13.
//  Copyright © 2017年 xxw. All rights reserved.
//

#import "PluginCImp.h"
#import <PluginCDef/PluginCDef.h>



__attribute__((constructor))
static void initializer(int argc, char** argv, char** envp)
{
    PluginCImp *pluginC = [[PluginCImp alloc] init];
    NSLog(@"init plugin: %@", [pluginC name]);
    [[PLPluginLoader defaultLoader] registerPlugin:pluginC];
}

@implementation PluginCImp

- (NSString *)name
{
    return @"PluginC";
}

- (NSString *)version
{
    return @"1.0.1";
}

- (UILabel *)label
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    label.text = @"label from plug C";
    return label;
}

@end
