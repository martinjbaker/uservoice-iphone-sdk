//
//  UserVoice.h
//  UserVoice
//
//  Created by Mirko Froehlich on 10/19/09.
//  Copyright 2009 UserVoice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserVoice : NSObject {

}

// Modally presents the UserVoice view and provides a way to exit the feedback
// flow and return to the app.
+ (void)presentUserVoiceModalViewControllerForParent:(UIViewController *)viewController 
											 andSite:(NSString *)site
											  andKey:(NSString *)key
										   andSecret:(NSString *)secret;

@end