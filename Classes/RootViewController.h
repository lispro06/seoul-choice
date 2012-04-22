//
//  RootViewController.h
//  RSSFun
//
//  Created by Ray Wenderlich on 1/24/11.
//  Copyright 2011 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebViewController;
@interface RootViewController : UITableViewController {
    WebViewController *_webViewController;
   
    NSMutableArray *_allEntries;
}
-(void)apply:(id)sender;
@property (retain) NSMutableArray *allEntries;

@property (retain) WebViewController *webViewController;
@end
