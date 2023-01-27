//
//  AppDelegate.m
//  reproduce_odr_crash
//
//  Created by Hongxi Pan on 2023/1/26.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)odr {
    int n = 20000;
    for(int i = 0; i < n; ++i) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            [NSOperationQueue.mainQueue addOperationWithBlock:^{
                NSSet *tags = [NSSet setWithObject:@"0460. Glamor - AShamaluevMusic.mp3"];
                NSBundleResourceRequest *request = [[NSBundleResourceRequest alloc] initWithTags:tags];
                [request beginAccessingResourcesWithCompletionHandler:^(NSError * _Nullable error) {
                    NSLog(@"xxxx, error: %@", error);
                }];
            }];
        });
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        while(true) {
            [[NSBundle mainBundle] objectForInfoDictionaryKey:@"test"];
        }
    });
    
    [self odr];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
