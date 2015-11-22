//
//  SHPImagePickerController.h
//  
//
//  Created by 刘子洋 on 15/1/19.
//  Copyright (c) 2015年 刘子洋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    SHPImagePickerTypeCamera,
    SHPImagePickerTypePhoto,
} SHPImagePickerType;

@interface SHPImagePickerController : NSObject

/**
 * 显示一个图片选取器，选取完成资源自动回调结果并关闭
 * @param type UIImagePicker类型
 * @param viewController 来源的ViewController
 * @param success 完成的回调
 */
+ (void)showImagePickerOfType:(SHPImagePickerType)type
           fromViewController:(UIViewController *)viewController
                      success:(void(^)(UIImage *image))success;

/**
 * 显示一个图片选取器
 * @param type UIImagePicker类型
 * @param viewController 来源的ViewController
 * @param success 完成的回调
 * @param autoDismiss 是否选取资源后自动关闭
 */
+ (void)showImagePickerOfType:(SHPImagePickerType)type
           fromViewController:(UIViewController *)viewController
                      success:(void (^)(UIImage *))success
                  autoDismiss:(BOOL)autoDismiss;

/**
 * 显示一个图片选取器
 * @param type UIImagePicker类型
 * @param viewController 来源的ViewController
 * @param success 完成的回调
 * @param autoDismiss 是否选取资源后自动关闭
 * @param allowEditing 是否允许编辑图片
 */
+ (void)showImagePickerOfType:(SHPImagePickerType)type
           fromViewController:(UIViewController *)viewController
                      success:(void (^)(UIImage *))success
                  autoDismiss:(BOOL)autoDismiss
                 allowEditing:(BOOL)allowEditing;

@end
