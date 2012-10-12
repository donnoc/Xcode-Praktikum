//
//  ViewController.m
//  ToDo-Liste
//
//  Created by 8huebert on 12.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListViewController.h"
#import "Task.h"
#import "DetailViewController.h"

@interface ListViewController()

@property (nonatomic, strong) NSArray* listOfTasks;

@end


@implementation ListViewController

@synthesize listOfTasks = _listOfTasks;



- (ListViewController*) initWithNibName:nibName bundle:bundle
{
	self = [super initWithNibName:nibName bundle:bundle];
	
	//initialize two default Tasks
	Task* firstTask = [[Task alloc] initWithName:@"Der Name"
										 andDate:@"21.02.2003"
								  andDescription:@"Bla bla bla"
										  andUrl:[[NSURL alloc] initFileURLWithPath:@"http://www.web.de"]
										  andGps: CLLocationCoordinate2DMake(111, 222)
					   ];
	Task* secondTask = [[Task alloc] initWithName:@"ein anderer Name"
										  andDate:@"09.02.2003"
								   andDescription:@"Blubb blubb blubb"
										   andUrl:[[NSURL alloc] initFileURLWithPath:@"http://www.gmx.de"]
										   andGps: CLLocationCoordinate2DMake(999, 999)
					   ];
	
	
	/**
	 * fill the TaskList with Tasks
	 *
	 * have to add in Mutable array and copy in normal-Array
	 * or the count funktion will not work
	 */
	// initialize an MutableArray
	NSMutableArray* tempListOfTasks = [[NSMutableArray alloc] init];
	// add the Tasks to the MutableArray
	[tempListOfTasks addObject:firstTask];
	[tempListOfTasks addObject:secondTask];
	// copy the Mutable array into an "normal"-array
	self.listOfTasks = [tempListOfTasks copy];
	//[tempListOfTasks release];
	/**
	 * END fill the TaskList with Tasks
	 */

		
	return self;
}


/**
 * tableView:numberOfRowsInSection:
 *
 * retuns the number of cells to show
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"[ListViewController] set number of Rows to %d", self.listOfTasks.count);
	return self.listOfTasks.count;
}

/**
 * tableView:cellForRowAtIndexPath:
 *
 * Fill the TableViewCells with content
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //name the identifier (don't know why)
	NSString* articleCellIdentifier = @"taskCell";
    
	//proof if an unused TableViewCell in in the TableView and reuse it
    UITableViewCell* result = [tableView dequeueReusableCellWithIdentifier:articleCellIdentifier];
    if(result == nil) {
		// if there is no unused cell: create a new one
        result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:articleCellIdentifier];
    }
	// pull a Task from the listOfTasks
    Task* task = [self.listOfTasks objectAtIndex:indexPath.row];
	// set some Labels
    result.textLabel.text       = task.name;
    result.detailTextLabel.text = task.name;
    
	NSLog(@"[ListViewController] show Tasks '%@' in List.", task.name);
	
    return result;
}

/**
 * tableView:didSelectRowAtIndexPath:
 *
 * Show the detail after clicked on a Task
 */
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        DetailViewController* detailViewController = [[DetailViewController alloc] initWithArticle:[self.rssArtikel objectAtIndex:indexPath.row]];
//        [self.navigationController pushViewController: derViewController animated:YES];
    } else {
//        self.iPadDetailsController.derArtikel = [self.rssArtikel objectAtIndex:indexPath.row];
//        [self.iPadDetailsController.navigationController popToRootViewControllerAnimated:YES];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// set the View Title
	self.title = @"ToDo Liste";
	
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
