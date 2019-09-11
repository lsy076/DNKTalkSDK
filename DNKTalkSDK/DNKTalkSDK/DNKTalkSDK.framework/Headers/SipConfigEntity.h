//
//  SipConfigEntity.h
//  DNKTalkSDK
//
//  Created by 赖盛源 on 2019/7/3.
//  Copyright © 2019 dnake_ay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SipConfigEntity : NSObject
//服务器地址
@property (copy, nonatomic) NSString *node;
//sip账号
@property (copy, nonatomic) NSString *user;
//sip密码
@property (copy, nonatomic) NSString *passwd;
//楼栋号
@property (copy, nonatomic) NSString *building;
//住户号
@property (copy, nonatomic) NSString *family;
//楼层号
@property (copy, nonatomic) NSString *floor;
//单元号
@property (copy, nonatomic) NSString *unit;
//推送的设备token
@property (copy, nonatomic) NSString *deviceToken;

//@property (copy, nonatomic) NSString *sendregister;

//@property (copy, nonatomic) NSString *realm;

//@property (copy, nonatomic) NSString *sip_port_override;

@end

NS_ASSUME_NONNULL_END
