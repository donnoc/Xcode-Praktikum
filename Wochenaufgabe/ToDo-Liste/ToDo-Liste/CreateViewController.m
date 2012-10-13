//
//  CreateViewController.m
//  ToDo-Liste
//
//  Created by 8huebert on 12.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreateViewController.h"

@implementation CreateViewController

@synthesize name = _name;
@synthesize datum = _datum;
@synthesize infos = _infos;
@synthesize datePicker = _datePicker;
@synthesize saveDateButton = _saveDateButton;
@synthesize delegate = _delegate;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) dismissKeyboard: (UITextField*) aTextField
{
    [aTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)clickGpsButton:(id)sender{
	
}

-(void)clickDateButton:(id)sender{
	NSLog(@"Datebutton wurde geklickt");

	[_saveDateButton setEnabled:YES];
	[_datePicker setHidden: NO];
  
}

-(void)clickSaveDateButton:(id)sender
{
	[_saveDateButton setEnabled:NO];
	[_datePicker setHidden: YES];
	
	[_datum setTitle:[[_datePicker date] description] forState:UIControlStateNormal];
	
	NSLog(@"Datum wurde mit Wert %@ geklickt", [_datePicker date]);
}

-(void)clickSaveButton:(id)sender
{
	NSLog(@"%@", self.delegate);
	Task* newTask = [[Task alloc] initWithName:[_name text]
									   andDate:_datum.titleLabel.text
								andDescription:[_infos text]
										andUrl:[NSURL URLWithString:[_homepage text]]
										andGps:CLLocationCoordinate2DMake(53.5990,9.9325)];	
	
	[self.delegate createViewController:self didCreatedTask:newTask];

}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
