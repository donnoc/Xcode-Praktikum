//
//  DatePickerViewController.m
//  MusterloesungTag1
//
//  Created by Felix Zwingenberger on 10.10.12.
//  Copyright (c) 2012 Uni Hamburg. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property (nonatomic, strong) IBOutlet UIDatePicker* datePicker;

@end

@implementation DatePickerViewController

@synthesize datePicker = _datePicker;

- (id)init {
    self = [super initWithNibName:@"DatePickerViewController" bundle:nil];
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onDoneButtonPressed {
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    [self.delegate datePickerController:self didSelectDate:self.datePicker.date];
}

@end
