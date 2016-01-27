//
//  UtilsMacro.h
//  exer
//
//  Created by 肖君 on 16/1/27.
//  Copyright © 2016年 ORA. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h

/******************************** 设备相关 ********************************/
#pragma mark - 设备相关

//屏幕的宽度,支持旋转屏幕
#define kScreen_Width                                                                                  \
((floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1)                            \
? (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]) \
? [UIScreen mainScreen].bounds.size.height                                              \
: [UIScreen mainScreen].bounds.size.width)                                              \
: [UIScreen mainScreen].bounds.size.width)

//屏幕的高度,支持旋转屏幕
#define kScreen_Height                                                                                 \
((floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1)                            \
? (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]) \
? [UIScreen mainScreen].bounds.size.width                                               \
: [UIScreen mainScreen].bounds.size.height)                                             \
: [UIScreen mainScreen].bounds.size.height)

//当前设备是iPhone
#define kDevice_is_iPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//当前设备是iPad
#define kDevice_is_iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

// iOS系统版本
#define kiOS_Version [[[UIDevice currentDevice] systemVersion] floatValue]
// iOS 9
#define kiOSVersion_9X (kiOS_Version >= 9.0f)
// iOS 8
#define kiOSVersion_8X (kiOS_Version >= 8.0f && kiOS_Version < 9.0f)
// iOS 7
#define kiOSVersion_7X (kiOS_Version >= 7.0f && kiOS_Version < 8.0f)

// iPhone4/4S
#define kDevice_is_iPhone4 ([[UIScreen mainScreen] bounds].size.height == 480)
// iPhone5/5C/5S
#define kDevice_is_iPhone5 ([[UIScreen mainScreen] bounds].size.height == 568)
// iPhone6
#define kDevice_is_iPhone6 ([[UIScreen mainScreen] bounds].size.height == 667)
// iPhone6 Plus
#define kDevice_is_iPhone6P ([[UIScreen mainScreen] bounds].size.height == 736)

#endif /* UtilsMacro_h */
