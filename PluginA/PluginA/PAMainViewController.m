//
//  PAMainViewController.m
//  PluginA
//
//  Created by xxw on 2017/2/10.
//  Copyright © 2017年 xxw. All rights reserved.
//

#import "PAMainViewController.h"
#import "PluginAService.h"
#import <PluginLoader/PluginLoader.h>

@interface PAMainViewController ()

@end

@implementation PAMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, self.view.frame.size.width, 50)];
    label.text = @"Plugin A Main ViewController";
    [self.view addSubview:label];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [imageView setBackgroundColor:[UIColor redColor]];
    imageView.image = [UIImage imageNamed:@"Adventure"
                                 inBundle:[PLPluginBundle pluginBundle:@"PluginA"]
            compatibleWithTraitCollection:nil];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
