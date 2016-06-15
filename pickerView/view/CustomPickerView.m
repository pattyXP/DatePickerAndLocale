//
//  CustomPickerView.m
//  pickerView
//
//  Created by patty on 16/6/15.
//  Copyright © 2016年 patty. All rights reserved.
//

#import "CustomPickerView.h"

@interface CustomPickerView ()
@property (nonatomic,strong) UILabel *localTimeLabel;//当地时间
@property (nonatomic,strong) UILabel *ChTimeLabel;//北京时间
@end

@implementation CustomPickerView

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        [self customView];
    }
    return self;
}

- (void)customView
{
    self.datePickerView = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 80, 300, 200)];
    self.datePickerView.backgroundColor = [UIColor yellowColor];
    self.datePickerView.datePickerMode = UIDatePickerModeDateAndTime;
    self.datePickerView.minuteInterval = 1;
    self.datePickerView.maximumDate = [NSDate distantFuture];
//       self.datePickerView.locale = [NSLocale systemLocale];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
    [formatter setLocale:locale];
    
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:timeZone];
    
    self.datePickerView.locale = locale;
    [self.datePickerView setDate:[NSDate date] animated:YES];
    [self addSubview:self.datePickerView];
    
    [self.datePickerView addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    
    self.localTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 300, 20)];
    self.ChTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, 300, 20)];
    [self addSubview:self.localTimeLabel];
    [self addSubview:self.ChTimeLabel];
    
    self.localTimeLabel.textColor = [UIColor blackColor];
    self.ChTimeLabel.textColor = [UIColor blackColor];
    
    self.localTimeLabel.text = [formatter stringFromDate:[NSDate date]];
    self.ChTimeLabel.text = [formatter stringFromDate:[NSDate date]];
}

-(void)dateChanged:(id)sender{
    UIDatePicker* control = (UIDatePicker*)sender;
    NSDate* date = control.date;
    /*添加你自己响应代码*/
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    self.localTimeLabel.text = [formatter stringFromDate:date];
    
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_ch"];
    [formatter setLocale:locale];
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    formatter.timeZone = sourceTimeZone;
    self.ChTimeLabel.text = [formatter stringFromDate:date];
}
@end
