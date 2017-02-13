//
//  ViewController.m
//  PluginApp
//
//  Created by xxw on 2017/2/10.
//  Copyright © 2017年 xxw. All rights reserved.
//

#import "ViewController.h"
#import <PluginA/PluginA.h>
#import <PluginB/PluginB.h>
#import <PluginLoader/PluginLoader.h>

#import <PluginCDef/PluginCDef.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    PBPluginB *b = [[PBPluginB alloc] init];
    
    // PluginAService *s = [[PluginAService alloc] init]; //必须要使用，才能加载
    id<PLPluginProtocal> loader = [[PLPluginLoader defaultLoader] findPlugin:@"PluginA"];
    if ([loader conformsToProtocol:@protocol(PluginAServiceProtocal)])
    {
        id<PluginAServiceProtocal> pluginA = (id<PluginAServiceProtocal>)loader;
        UIViewController *vc = [pluginA mainViewController];
        [self.view addSubview:vc.view];
    }
    
    
    id<PLPluginProtocal> pluginC = [[PLPluginLoader defaultLoader] findPlugin:@"PluginC"];
    NSLog(@"%p", pluginC);
    if ([pluginC conformsToProtocol:@protocol(PCPluginCProtocal)])
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
