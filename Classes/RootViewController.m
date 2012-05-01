//
//  RootViewController.m
//  RSSFun
//
//  Created by Ray Wenderlich on 1/24/11.
//  Copyright 2011 Ray Wenderlich. All rights reserved.
//

#import "WebViewController.h"
#import "RSSEntry.h"
#import "RootViewController.h"
#import "RSSEntry.h"
@implementation RootViewController
@synthesize webViewController = _webViewController;
@synthesize allEntries = _allEntries;

- (void)addRows {
    NSString * theDateString;
    
    NSDate * aDate;
    aDate=[[NSDate alloc]init];
    
    NSDateFormatter * aDateFormatter;
    aDateFormatter=[[NSDateFormatter alloc] init];
    [aDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [aDateFormatter setDateFormat:@"MM-dd-yyyy"];
    
    theDateString=@"01-27-2012";
    aDate=[aDateFormatter dateFromString:theDateString];
    RSSEntry *entry1 = [[[RSSEntry alloc] initWithBlogTitle:@"201차" 
                                               articleTitle:@"한남동 꼰벤뚜알 수도원" 
                                                 articleUrl:@"http://www.2030.or.kr/choice/schedule_view.asp?chaNum=1" 
                                                articleDate:aDate] autorelease];
    theDateString=@"03-16-2012";
    aDate=[aDateFormatter dateFromString:theDateString];
    RSSEntry *entry2 = [[[RSSEntry alloc] initWithBlogTitle:@"202차" 
                                               articleTitle:@"한남동 꼰벤뚜알 수도원" 
                                                 articleUrl:@"http://www.2030.or.kr/choice/schedule_view.asp?chaNum=2" 
                                                articleDate:aDate] autorelease];
    theDateString=@"04-13-2012";
    aDate=[aDateFormatter dateFromString:theDateString];
    RSSEntry *entry3 = [[[RSSEntry alloc] initWithBlogTitle:@"203차" 
                                               articleTitle:@"한남동 꼰벤뚜알 수도원" 
                                                 articleUrl:@"http://www.2030.or.kr/choice/schedule_view.asp?chaNum=3" 
                                                articleDate:aDate] autorelease];
    theDateString=@"05-04-2012";
    aDate=[aDateFormatter dateFromString:theDateString];
    RSSEntry *entry4 = [[[RSSEntry alloc] initWithBlogTitle:@"204차" 
                                               articleTitle:@"한남동 꼰벤뚜알 수도원" 
                                                 articleUrl:@"http://www.2030.or.kr/choice/schedule_view.asp?chaNum=4" 
                                                articleDate:aDate] autorelease];
    theDateString=@"06-22-2012";
    aDate=[aDateFormatter dateFromString:theDateString];
    RSSEntry *entry5 = [[[RSSEntry alloc] initWithBlogTitle:@"205차" 
                                               articleTitle:@"한남동 꼰벤뚜알 수도원" 
                                                 articleUrl:@"http://www.2030.or.kr/choice/schedule_view.asp?chaNum=5" 
                                                articleDate:aDate] autorelease];
    theDateString=@"08-10-2012";
    aDate=[aDateFormatter dateFromString:theDateString];
    RSSEntry *entry6 = [[[RSSEntry alloc] initWithBlogTitle:@"206차" 
                                               articleTitle:@"한남동 꼰벤뚜알 수도원" 
                                                 articleUrl:@"http://www.2030.or.kr/choice/schedule_view.asp?chaNum=6" 
                                                articleDate:aDate] autorelease];
    theDateString=@"09-15-2012";
    aDate=[aDateFormatter dateFromString:theDateString];
    RSSEntry *entry7 = [[[RSSEntry alloc] initWithBlogTitle:@"4차디퍼" 
                                               articleTitle:@"한남동 꼰벤뚜알 수도원" 
                                                 articleUrl:@"http://www.2030.or.kr/choice/schedule_view.asp?chaNum=7" 
                                                articleDate:aDate] autorelease];
    theDateString=@"10-12-2012";
    aDate=[aDateFormatter dateFromString:theDateString];
    RSSEntry *entry8 = [[[RSSEntry alloc] initWithBlogTitle:@"207차" 
                                               articleTitle:@"한남동 꼰벤뚜알 수도원" 
                                                 articleUrl:@"http://www.2030.or.kr/choice/schedule_view.asp?chaNum=8" 
                                                articleDate:aDate] autorelease];
    theDateString=@"11-09-2012";
    aDate=[aDateFormatter dateFromString:theDateString];
    RSSEntry *entry9 = [[[RSSEntry alloc] initWithBlogTitle:@"208차" 
                                               articleTitle:@"한남동 꼰벤뚜알 수도원" 
                                                 articleUrl:@"http://www.2030.or.kr/choice/schedule_view.asp?chaNum=9" 
                                                articleDate:aDate] autorelease];
    
    
    [_allEntries insertObject:entry9 atIndex:0];
    [_allEntries insertObject:entry8 atIndex:0];
    [_allEntries insertObject:entry7 atIndex:0];
    [_allEntries insertObject:entry6 atIndex:0];
    [_allEntries insertObject:entry5 atIndex:0];
    [_allEntries insertObject:entry4 atIndex:0];
    [_allEntries insertObject:entry3 atIndex:0];
    [_allEntries insertObject:entry2 atIndex:0];
    [_allEntries insertObject:entry1 atIndex:0];
    
}

-(void)apply:(id)sender {
        if (_webViewController == nil) {
            self.webViewController = [[[WebViewController alloc] initWithNibName:@"WebViewController" bundle:[NSBundle mainBundle]] autorelease];
        }
        NSString * theDateString;
        
        NSDate * aDate;
        aDate=[[NSDate alloc]init];
        
        NSDateFormatter * aDateFormatter;
        aDateFormatter=[[NSDateFormatter alloc] init];
        [aDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
        [aDateFormatter setDateFormat:@"MM-dd-yyyy"];
        
        theDateString=@"08-10-2012";
        aDate=[aDateFormatter dateFromString:theDateString];
        RSSEntry *entry2 = [[[RSSEntry alloc] initWithBlogTitle:@"206차" 
                                                   articleTitle:@"한남동 꼰벤뚜알 수도원" 
                                                     articleUrl:@"http://www.2030.or.kr/choice/application.asp?chaNum=6" 
                                                    articleDate:aDate] autorelease];
        _webViewController.entry = entry2;
        [self.navigationController pushViewController:_webViewController animated:YES];
        
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithTitle:@"신청"
                                                                       style:UIBarButtonItemStylePlain target:self action:@selector(apply:)];
    self.navigationItem.rightBarButtonItem = settingsButton;
    [settingsButton release];
    self.navigationItem.title = @"선택주말일정";
    //self.title = @"Feeds";
    self.allEntries = [NSMutableArray array];
   [self addRows];
}

/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_allEntries count];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_webViewController == nil) {
        self.webViewController = [[[WebViewController alloc] initWithNibName:@"WebViewController" bundle:[NSBundle mainBundle]] autorelease];
    }
    
    RSSEntry *entry = [_allEntries objectAtIndex:indexPath.row];
    _webViewController.entry = entry;
    [self.navigationController pushViewController:_webViewController animated:YES];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    RSSEntry *entry = [_allEntries objectAtIndex:indexPath.row];
    
    NSDateFormatter * dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    //[dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    NSString *articleDateString = [dateFormatter stringFromDate:entry.articleDate];
    
    cell.textLabel.text = entry.blogTitle;        
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", articleDateString, entry.articleTitle];
    
    return cell;
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */



#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
//    self.webViewController = nil;
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [_allEntries release];
    _allEntries = nil;
    [super dealloc];
}


@end

