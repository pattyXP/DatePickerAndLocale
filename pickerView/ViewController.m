//
//  ViewController.m
//  pickerView
//
//  Created by patty on 16/6/15.
//  Copyright © 2016年 patty. All rights reserved.
//

#import "ViewController.h"
#import "CustomPickerView.h"

@interface ViewController ()
@property (nonatomic,strong) CustomPickerView *pickerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customUI];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customUI
{
    self.pickerView = [[CustomPickerView alloc] initWithFrame:CGRectMake(0, 100, 300, 300)];
    [self.view addSubview:self.pickerView];
}
@end
