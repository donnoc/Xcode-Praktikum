//
//  CreateViewController.h
//  ToDo-Liste
//
//  Created by 8huebert on 12.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@class Task;
@protocol CreateViewControllerDelegate;





@interface CreateViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField* name;
@property (nonatomic, strong) IBOutlet UIButton* datum;
@property (nonatomic, strong) IBOutlet UITextView* infos;
@property (nonatomic, strong) IBOutlet UITextField* homepage;
@property (nonatomic, strong) IBOutlet UIDatePicker* datePicker;
@property (nonatomic, strong) IBOutlet UIBarButtonItem* saveDateButton;

@property (nonatomic, weak) id<CreateViewControllerDelegate> delegate;



-(IBAction)clickGpsButton:(id)sender;
-(IBAction)clickDateButton:(id)sender;
-(IBAction)clickSaveDateButton:(id)sender;
-(IBAction)dismissKeyboard:(UITextField*)aTextField;
-(IBAction)clickSaveButton:(id)sender;

@end



@protocol CreateViewControllerDelegate

- (void)createViewController:(CreateViewController *)createViewController didCreatedTask:(Task *)task;

@end