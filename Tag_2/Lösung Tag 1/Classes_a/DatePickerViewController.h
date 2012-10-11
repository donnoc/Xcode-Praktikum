//
//  DatePickerViewController.h
//  MusterloesungTag1
//
//  Created by Felix Zwingenberger on 10.10.12.
//  Copyright (c) 2012 Uni Hamburg. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DatePickerViewControllerDelegate;

@interface DatePickerViewController : UIViewController

@property (nonatomic, weak) id<DatePickerViewControllerDelegate> delegate;

@end

@protocol DatePickerViewControllerDelegate

-(void)datePickerController:(DatePickerViewController*)datePickerController didSelectDate:(NSDate*)selectedDate;

@end