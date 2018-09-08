//
//  ViewController.m
//  runtimeMethods
//
//  Created by 刘峥嵘 on 2018/9/7.
//  Copyright © 2018 刘峥嵘. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"
@interface ViewController ()
@property(nonatomic,strong)Person* person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.person = [[Person alloc] init];
    [self class_GetName];
    [self class_getSuperclass];
    [self class_isMetaClass];
    [self class_getInstanceSize];
}


#pragma mark 获取类名的字符串
-(void)class_GetName
{
    NSString* str = @"";
//    NSDictionary*dict = @{@"name":@"hello"};
  const char* classGetName = class_getName([str class]);
    NSString* classGetNameOC = [NSString stringWithCString:classGetName encoding:NSUTF8StringEncoding];
    NSString* ocGetClassName = NSStringFromClass([str class]);
    NSLog(@"runtimeGet:%@ \n ocGet:%@",classGetNameOC,ocGetClassName);
}
#pragma mark 获取父类
-(void)class_getSuperclass
{
    NSString* str = nil;
    Class class = class_getSuperclass([str class]);
    NSLog(@"父类：%@",class);
    //Class class_setSuperclass(Class cls, Class newSuper); 设定给定类的父类，使用不到
}

-(void)class_isMetaClass
{
//    char* student = "student";
    //类的isa 指针指向元类
    BOOL isMetaClass =class_isMetaClass([NSString class]);
    NSLog(@"是否元类：%d",isMetaClass);
}

-(void)class_getInstanceSize
{
    size_t d = class_getInstanceSize([self.person class]);
    NSLog(@"类的大小：%zu",d);
}

@end
