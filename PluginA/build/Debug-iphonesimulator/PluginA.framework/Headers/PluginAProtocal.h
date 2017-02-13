//
//  PluginA.h
//  PluginA
//
//  Created by xxw on 2017/2/10.
//  Copyright © 2017年 xxw. All rights reserved.
//

#import <PluginLoader/PluginLoader.h>

@protocol PluginAServiceProtocal <PLPluginProtocal>

- (NSBundle *)bundle;

- (UIViewController *)mainViewController;

@end

