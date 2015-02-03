//
//  UWImagePickerHelper.h
//  uwu
//
//  Created by LiuZiyang on 15/1/19.
//  Copyright (c) 2015年 Yicheng Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    ZYUIImagePickerTypeCamera,
    ZYUIImagePickerTypePhoto,
}ZYUIImagePickerType;

@interface ZYUIImagePickerHelper : NSObject

+ (void)showImagePickerOfType:(ZYUIImagePickerType)type
           fromViewController:(UIViewController *)viewController
                      success:(void(^)(UIImage *image))success;

+ (void)showImagePickerOfType:(ZYUIImagePickerType)type
           fromViewController:(UIViewController *)viewController
                      success:(void (^)(UIImage *))success
                  autoDismiss:(BOOL)autoDismiss;

+ (void)showImagePickerOfType:(ZYUIImagePickerType)type
           fromViewController:(UIViewController *)viewController
                      success:(void (^)(UIImage *))success
                  autoDismiss:(BOOL)autoDismiss
                 allowEditing:(BOOL)allowEditing;

@end
