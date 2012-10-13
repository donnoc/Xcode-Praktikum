//
//  DetailViewController_iPhone.m
//  ToDo-Liste
//
//  Created by 8huebert on 12.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController()

@property (nonatomic, strong) Task* detailTask;

@end



@implementation DetailViewController


@synthesize detailTask = _detailTask;
@synthesize name = _name;
@synthesize datum = _datum;
@synthesize infos = _infos;



-(DetailViewController*) initWithTask:(Task*) singleTask
{
	self = [super init];
	
	self = [self initWithNibName:@"DetailViewController_iPhone" bundle:nil];
	
	NSLog(@"[DetailViewController] initialisiere mit Task %@ ", singleTask.name);
	
	if (self) {
		self.detailTask = singleTask;
	}
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

-(void)clickHomepageButton:(id)sender
{
	WebViewController* derViewController = [[WebViewController alloc] initWithUrl:self.detailTask.url];
    [self.navigationController pushViewController: derViewController animated:YES];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	[_name setText:self.detailTask.name];
	[_datum setText:self.detailTask.date];
	[_infos setText:self.detailTask.description];
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
