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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PBPluginB *b = [[PBPluginB alloc] init];
    
    id<PLPluginProtocal> loader = [[PLPluginLoader defaultLoader] findPlugin:@"PluginA"];
    if ([loader conformsToProtocol:@protocol(PluginAServiceProtocal)])
    {
        id<PluginAServiceProtocal> pluginA = (id<PluginAServiceProtocal>)loader;
        UIViewController *vc = [pluginA mainViewController];
        [self.view addSubview:vc.view];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
