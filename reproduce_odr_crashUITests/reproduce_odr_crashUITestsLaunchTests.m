//
//  reproduce_odr_crashUITestsLaunchTests.m
//  reproduce_odr_crashUITests
//
//  Created by Hongxi Pan on 2023/1/26.
//

#import <XCTest/XCTest.h>

@interface reproduce_odr_crashUITestsLaunchTests : XCTestCase

@end

@implementation reproduce_odr_crashUITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
