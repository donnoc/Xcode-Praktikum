//
//  ViewController.m
//  MusterloesungTag1
//
//  Created by Felix Zwingenberger on 10.10.12.
//  Copyright (c) 2012 Uni Hamburg. All rights reserved.
//

#import "ViewController.h"
#import "DatePickerViewController.h"
#import "Article.h"

@interface ViewController ()<DatePickerViewControllerDelegate>

@property (nonatomic, strong) IBOutlet UITextField* titleTextField;
@property (nonatomic, strong) IBOutlet UITextField* urlTextField;
@property (nonatomic, strong) IBOutlet UITextView* textTextView;
@property (nonatomic, strong) IBOutlet UIButton* datePickerButton;

@property (nonatomic, strong) NSDateFormatter* dateFormatter;
@end

@implementation ViewController

@synthesize titleTextField = _titleTextField;
@synthesize urlTextField = _urlTextField;
@synthesize textTextView = _textTextView;
@synthesize datePickerButton = _datePickerButton;
@synthesize dateFormatter = _dateFormatter;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateStyle = NSDateFormatterShortStyle;
    self.dateFormatter.timeStyle = NSDateFormatterShortStyle;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)dismissKeyboard:(id)sender {
    if([sender isKindOfClass:[UITextField class]]) {
        [sender resignFirstResponder];
    }
    else {
        [self.textTextView resignFirstResponder];        
    }
}

-(IBAction)selectDateButtonPressed {
    DatePickerViewController* datePickerController = [[DatePickerViewController alloc] init];
    datePickerController.delegate = self;
    
    [self presentViewController:datePickerController animated:YES completion:nil];
}

-(IBAction)createArticleButtonPressed {
    NSURL* url = [NSURL URLWithString:self.urlTextField.text];

    Article* article = [[Article alloc] initWithTitle:self.titleTextField.text text:self.textTextView.text url:url date:[self.dateFormatter dateFromString:self.datePickerButton.titleLabel.text]];
    NSLog(@"\nTitel: %@, \nDatum: %@, \nURL: %@, \nText: %@", article.title, [self.dateFormatter stringFromDate:article.date], article.url, article.text);
}

-(void)datePickerController:(DatePickerViewController *)datePickerController didSelectDate:(NSDate *)selectedDate {

    self.datePickerButton.titleLabel.text = [self.dateFormatter stringFromDate:selectedDate];
}

@end
