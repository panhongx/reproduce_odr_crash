//
//  AppDelegate.m
//  reproduce_odr_crash
//
//  Created by Hongxi Pan on 2023/1/26.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSMutableArray *requests;

@end

@implementation AppDelegate

- (void)getString {
    NSString *url = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"test"];
    NSLog(@"url is %@", url);
}

- (void)odr {
    int n = 12;
    for(int i = 0; i < n; ++i) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSSet *tags = [NSSet setWithObject:@"0460. Glamor - AShamaluevMusic.mp3"];
            NSBundleResourceRequest *request = [[NSBundleResourceRequest alloc] initWithTags:tags];
            [request conditionallyBeginAccessingResourcesWithCompletionHandler:^(BOOL resourcesAvailable) {
                if(resourcesAvailable) {
                    NSLog(@"resource available!");
                } else {
                    [NSOperationQueue.mainQueue addOperationWithBlock:^{
                        [self getResource];
                    }];
                }
                
            }];
        });
    }
}

- (void)getResource {
    NSSet *tags = [NSSet setWithObject:@"0460. Glamor - AShamaluevMusic.mp3"];
    NSBundleResourceRequest *request = [[NSBundleResourceRequest alloc] initWithTags:tags];
    [self.requests addObject:request];
    [request beginAccessingResourcesWithCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"xxxx, error: %@", error);
    }];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.requests = [[NSMutableArray alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        while(true) {
            [self getString];
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
