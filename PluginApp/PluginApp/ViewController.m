//
//  ViewController.m
//  PluginApp
//
//  Created by xxw on 2017/2/10.
//  Copyright © 2017年 xxw. All rights reserved.
//

#import "ViewController.h"
#import <PluginAProtocol/PluginAProtocol.h>
#import <PluginB/PluginB.h>
#import <PluginLoader/PluginLoader.h>

#import <PluginCDef/PluginCDef.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    id<PLPluginProtocol> plugin = [[PLPluginLoader defaultLoader] findPlugin:@"PluginB"];
    if ([plugin conformsToProtocol:@protocol(PluginBProtocol)])
    {
        id<PluginBProtocol> pluginB = (id<PluginBProtocol>)plugin;
        [pluginB sayHello];
    }
    
    // PluginAService *s = [[PluginAService alloc] init]; //必须要使用，才能加载
    id<PLPluginProtocol> loader = [[PLPluginLoader defaultLoader] findPlugin:@"PluginA"];
    if ([loader conformsToProtocol:@protocol(PluginAProtocol)])
    {
        id<PluginAProtocol> pluginA = (id<PluginAProtocol>)loader;
        UIViewController *vc = [pluginA mainViewController];
        [self.view addSubview:vc.view];
    }
    
    id<PLPluginProtocol> pluginC = [[PLPluginLoader defaultLoader] findPlugin:@"PluginC"];
    NSLog(@"%p", pluginC);
    if ([pluginC conformsToProtocol:@protocol(PCPluginProtocal)])
    {
        id<PCPluginProtocal> pluginCC = (id<PCPluginProtocal>)pluginC;
        UILabel *label = [pluginCC label];
        [self.view addSubview:label];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
