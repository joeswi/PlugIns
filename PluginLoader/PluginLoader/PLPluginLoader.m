//
//  PluginLoader.m
//  PluginLoader
//
//  Created by xxw on 2017/2/10.
//  Copyright © 2017年 xxw. All rights reserved.
//

#import "PluginLoader.h"

@interface PLPluginLoader ()

@property (nonatomic, strong) NSMutableDictionary *plugins;

@end

@implementation PLPluginLoader

+ (instancetype)defaultLoader
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.plugins = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)loadPlugins:(NSArray *)plugins
{
    for (Class pluginClass in plugins)
    {
        id plugin = [[pluginClass alloc] init];
        if ([plugin conformsToProtocol:@protocol(PLPluginProtocol)] && [plugin conformsToProtocol:@protocol(PLPluginLoadable)])
        {
            id<PLPluginProtocol> pluginImp = (id<PLPluginProtocol>) plugin;
            [self registerPlugin:pluginImp];
            NSLog(@"load plugin: '%@'.", [pluginImp name]);
        }
    }
}

- (id<PLPluginProtocol>)findPlugin:(NSString *)name
{
    if (name)
    {
        @synchronized (self)
        {
            return self.plugins[name];
        }
    }
    return nil;
}


- (void)registerPlugin:(id<PLPluginProtocol>)plugin
{
    if (plugin)
    {
        @synchronized (self)
        {
            [self.plugins setValue:plugin forKey:[plugin name]];
        }
    }
}

@end

@implementation PLPluginBundle

+ (NSBundle *)pluginBundle:(NSString *)name
{
    if ([name length] > 0)
    {
        NSString *mainBundlePath = [[NSBundle mainBundle] resourcePath];
        NSString *frameworkBundlePath = [mainBundlePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.bundle", name]];
        NSBundle *frameworkBundle = [NSBundle bundleWithPath:frameworkBundlePath];
        return frameworkBundle;
    }
    return nil;
}

@end
