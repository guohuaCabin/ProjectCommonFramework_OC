//
//  QGHNetworking.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/26.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <Foundation/Foundation.h>

//网络状态枚举
typedef NS_ENUM(NSInteger, QGHNetworkStatus){
    //未知状态呢
    QGHNetworkStatusUnknown          = -1,
    //未连接
    QGHNetworkStatusNotReachable     = 0,
    //WWAN
    QGHNetworkStatusReachableViaWWAN = 1,
    //wifi
    QGHNetworkStatusReachableViaWiFi = 2,
};

//请求任务
typedef NSURLSessionTask QGHURLSessionTask;

/**
 成功回调
 
 @param response 返回请求数据
 */
typedef void(^QGHResponseSuccessBlock)(id response);

/**
 失败回调
 
 @param error 返回错误信息
 */
typedef void(^QGHResponseFailBlock)(NSError *error);

/**
 下载进度
 
 @param bytesRead 已下载的大小
 @param totalBytes 总下载大小
 */
typedef void(^QGHDownloadProgress)(int64_t bytesRead,int64_t totalBytes);

/**
 下载成功回调
 
 @param url 下载存放的路径
 */
typedef void(^QGHDownloadSuccessBlock)(NSURL *url);


/**
 上传进度
 
 @param bytesWritten 已上传的大小
 @param totalBytes 总上传大小
 */
typedef void(^QGHUploadProgressBlock)(int64_t bytesWritten, int64_t totalBytes);


/**
 多文件上传成功回调
 
 @param respones 成功返回的数据
 */
typedef void(^QGHMultUploadSuccessBlock)(NSArray *respones);


/**
 多文件上传失败回调
 
 @param errors    失败返回的错误信息
 */
typedef void(^QGHMultUploadFailBlock)(NSArray *errors);

typedef QGHDownloadProgress QGHGetProgress;

typedef QGHDownloadProgress QGhPostProgress;

typedef QGHResponseFailBlock QGHDownloadFailBlock;

@interface QGHNetworking : NSObject


/**
 正在运行的网络任务

 @return tasks
 */
+(NSArray *)currentRunningTasks;


/**
 配置请求头

 @param httpHeader 请求头
 */
+(void)configHttpHeader:(NSDictionary *)httpHeader;


/**
 取消请求

 @param url 取消请求的url
 */
+(void)cancelRequestWithURL:(NSString *)url;


/**
 取消所有的请求
 */
+(void)cancleAllRequest;


/**
 设置超时时间

 @param timeout 超时时间
 */
+(void)setupTimeOut:(NSTimeInterval)timeout;


/**
 get请求

 @param url url
 @param refresh 是否刷新(遇到重复请求，若为YES，则会取消旧的请求，用新的请求，若为NO，则忽略新请求，用旧请求)
 @param cache 是否缓存
 @param params 请求参数
 @param progressBlock 进度回调
 @param successBlock 成功回调
 @param failBlock 失败回调
 @return 返回请求任务
 */
+(QGHURLSessionTask *)getRequstWithUrl:(NSString *)url
                        refreshRequest:(BOOL)refresh
                                 cache:(BOOL)cache
                                params:(NSDictionary *)params
                         progressBlock:(QGHGetProgress)progressBlock
                          successBlock:(QGHResponseSuccessBlock)successBlock
                             failBlock:(QGHResponseFailBlock)failBlock;

/**
post请求
 
 @param url url
 @param refresh 是否刷新(遇到重复请求，若为YES，则会取消旧的请求，用新的请求，若为NO，则忽略新请求，用旧请求)
 @param cache 是否缓存
 @param params 请求参数
 @param progressBlock 进度回调
 @param successBlock 成功回调
 @param failBlock 失败回调
 @return 返回请求任务
 */
+(QGHURLSessionTask *)postRequstWithUrl:(NSString *)url
                        refreshRequest:(BOOL)refresh
                                 cache:(BOOL)cache
                                params:(NSDictionary *)params
                         progressBlock:(QGhPostProgress)progressBlock
                          successBlock:(QGHResponseSuccessBlock)successBlock
                             failBlock:(QGHResponseFailBlock)failBlock;

/**
 文件上传

 @param url 上传文件url
 @param data 文件数据
 @param type 文件类型
 @param name 上传文件服务器文件夹名
 @param mimeType 上传文件路径
 @param progressBlock 上传进度
 @param successBlock 成功回调
 @param faliBlock 失败回调
 @return 返回的对象
 */
+(QGHURLSessionTask *)uploadFileWithUrl:(NSString *)url
                               fileData:(NSData *)data
                                   type:(NSString *)type
                                   name:(NSString *)name
                               mimeType:(NSString *)mimeType
                          progressBlock:(QGHUploadProgressBlock)progressBlock
                           successBlock:(QGHResponseSuccessBlock)successBlock
                              faliBlock:(QGHResponseFailBlock)faliBlock;

/**
 多文件上传
 
 @param url 上传文件url
 @param datas 文件数据集合
 @param type 文件类型
 @param name 上传文件服务器文件夹名
 @param mimeType 上传文件路径
 @param progressBlock 上传回调
 @param successBlock 成功回调
 @param faliBlock 失败回调
 @return 任务集合
 */
+(QGHURLSessionTask *)uploadMultFileWithUrl:(NSString *)url
                               fileDatas:(NSArray *)datas
                                   type:(NSString *)type
                                   name:(NSString *)name
                               mimeType:(NSString *)mimeType
                          progressBlock:(QGHUploadProgressBlock)progressBlock
                           successBlock:(QGHMultUploadSuccessBlock)successBlock
                              faliBlock:(QGHMultUploadFailBlock)faliBlock;


/**
 文件下载

 @param url 下载文件的url
 @param progressBlock 下载进度
 @param successBlock 成功回调
 @param failBlock 失败回调
 @return 返回的对象
 */
+(QGHURLSessionTask *)downloadWithUrl:(NSString *)url
                        progressBlock:(QGHDownloadProgress)progressBlock
                         successBlock:(QGHDownloadSuccessBlock)successBlock
                            failBlock:(QGHDownloadFailBlock)failBlock;


@end


@interface QGHNetworking (cache)

//获取缓存目录路径
+(NSString *)getCacheDiretoryPath;

//获取下载目录路径
+(NSString *)getDownDirectoryPath;

//获取缓存大小
+(NSUInteger)totalCacheSize;

//清除所有缓存
+(void)clearTotalCache;

//获取所有下载数据大小
+(NSUInteger)totalDownloadDataSize;

//清除下载数据
+(void)clearDownloadData;

@end

























