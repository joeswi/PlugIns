//
//  ViewController.m
//  PluginApp
//
//  Created by xxw on 2017/2/10.
//  Copyright © 2017年 xxw. All rights reserved.
//

#import "ViewController.h"
#import <PluginA/PluginA.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", [PluginAService name]);
    
    
    UIViewController *pluginAMain = [PluginAService mainViewController];
    [self.view addSubview:pluginAMain.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
