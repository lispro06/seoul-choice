//
//  GalleryDetails.m
//  DietCenter
//
//Sugartin
//

#import "GalleryDetails.h"

@interface GalleryDetails ()
- (void)setupImages ;
@end

@implementation GalleryDetails
@synthesize objMan = _objMan;
@synthesize arrForDetails = _arrForDetails;
@synthesize ScrForImag = _ScrForImag;
@synthesize arForImages = _arForImages;
@synthesize scrPage = _scrPage;
@synthesize imgV = _imgV;
@synthesize currentPage = _currentPage;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}




#pragma mark - View lifecycle
- (void)viewWillAppear:(BOOL)animated 
{
	[super viewWillAppear:animated];    
    
}
-(void)viewDidAppear:(BOOL)animated{
    
	[self navigationController].navigationBarHidden = YES;
    
    
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
	[self navigationController].navigationBarHidden = NO;	
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.ScrForImag.pagingEnabled=TRUE;	
	self.ScrForImag.backgroundColor=[UIColor whiteColor];
    

    self.objMan = [[HJObjManager alloc] initWithLoadingBufferSize:20 memCacheSize:20];
	NSString* cacheDirectory = [NSHomeDirectory() stringByAppendingString:@"/Library/Caches/imgcache/Gallery/"] ;
	HJMOFileCache* fileCache = [[HJMOFileCache alloc] initWithRootPath:cacheDirectory] ;
	self.objMan.fileCache = fileCache;
    
	// Have the file cache trim itself down to a size & age limit, so it doesn't grow forever
	
	fileCache.fileCountLimit = 100;
	fileCache.fileAgeLimit = 60*60*24*30; //1 week
	[fileCache trimCacheUsingBackgroundThread];
    
    self.arForImages=[NSArray arrayWithObjects:@"http://lispro06.woweb.net/choice/2012_5.jpg",@"http://lispro06.woweb.net/choice/2012_4.jpg",@"http://lispro06.woweb.net/choice/2012_3.jpg",@"http://lispro06.woweb.net/choice/2012_2.jpg",@"http://lispro06.woweb.net/choice/2012_1.jpg", nil];
    [self setupImages];
}

#define kXDistance    8
#define kYDistance    5
#define kThumbWidth   50
#define kThumbHeight   50
#define kTagForImageView    10000


- (void)setupImages {
    [[self.scrPage subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.scrPage.contentSize=CGSizeMake((self.arForImages.count)*100, 65);
    NSUInteger i=2; // images starting from location 2
    for (NSString *str in self.arForImages) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        
                NSUInteger xVal=(i+1)*kXDistance;
                NSLog(@"%i",xVal);
                xVal = xVal + (i*kThumbWidth);
                NSLog(@"and end is %i",xVal);
        
        if(i==2)
            [btn setFrame:CGRectMake(xVal, kYDistance , kThumbWidth, kThumbHeight)];
        else
            [btn setFrame:CGRectMake(xVal, kYDistance, kThumbWidth, kThumbHeight)];
        btn.tag=i-1; // index tagging strating from 1
        
        HJManagedImageV *imgV=[[HJManagedImageV alloc] initWithFrame:CGRectMake(0, 0, kThumbWidth, kThumbHeight)];
        
        [imgV showLoadingWheel];
        imgV.tag=kTagForImageView;
        imgV.url=[NSURL URLWithString:[self.arForImages objectAtIndex:i-2]];
        imgV.clipsToBounds=YES;
        imgV.layer.borderColor = [[UIColor blackColor] CGColor];
        imgV.layer.borderWidth = 1;
        imgV.layer.cornerRadius = 3;
        [self.objMan manage:imgV];
        [btn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchDown];
        [btn addSubview:imgV];
        
        [self.scrPage addSubview:btn];
        i++;
    }
    [self.imgV showLoadingWheel];
     self.imgV.url=[NSURL URLWithString:[NSString stringWithFormat:@"%@",[self.arForImages objectAtIndex:0]]];
    [self.objMan manage:self.imgV];
    self.currentPage = 0;
}
- (void)btnTapped:(UIButton*)btn {
    self.scrPage.delegate=nil;
    CGRect rectToScroll = btn.frame;
    rectToScroll=CGRectMake(rectToScroll.origin.x-63-63, kYDistance, 320, 68);
    [self.scrPage scrollRectToVisible:rectToScroll animated:YES];


    self.imgV.url=[NSURL URLWithString:[NSString stringWithFormat:@"%@",[self.arForImages objectAtIndex:btn.tag-1]]];
    NSLog(@"%@",[NSString stringWithFormat:@"%@",[self.arForImages objectAtIndex:btn.tag-1]]);
    [self.objMan manage:self.imgV];
    [self.scrPage performSelector:@selector(setDelegate:) withObject:self afterDelay:0.3];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger curPage = (scrollView.contentOffset.x - 5 ) / 63;
    if(curPage<0 || curPage>=self.arForImages.count) return;
    if(curPage!=self.currentPage) {
        self.imgV.url=[NSURL URLWithString:[self.arForImages objectAtIndex:curPage]];
        [self.objMan manage:self.imgV];
        self.currentPage=curPage;
    }
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
