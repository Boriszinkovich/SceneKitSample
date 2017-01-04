//
//  MainViewController.m
//  SceneKitTry
//
//  Created by Boris on 4/7/16.
//  Copyright © 2016 Boris. All rights reserved.
//

#import "MainViewController.h"

#import "BZExtensionsManager.h"

#import <SceneKit/SceneKit.h>

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - Class Methods (Public)

#pragma mark - Class Methods (Private)

#pragma mark - Init & Dealloc

#pragma mark - Setters (Public)

#pragma mark - Getters (Public)

#pragma mark - Setters (Private)

#pragma mark - Getters (Private)

#pragma mark - Lifecycle

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.isFirstLoad)
    {
        [self createAllViews];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Create Views & Variables

- (void)createAllViews
{
    if (!self.isFirstLoad)
    {
        return;
    }
    self.isFirstLoad = NO;
    self.navigationController.navigationBar.hidden = YES;
    
    SCNView *theSceneView = [SCNView new];
    [self.view addSubview:theSceneView];
    theSceneView.theHeight = theSceneView.superview.theHeight;
    theSceneView.theWidth = theSceneView.superview.theWidth;
    
    SCNScene *theMainScene = [SCNScene sceneNamed:@"2067.dae"];
    theSceneView.scene = theMainScene;
    theSceneView.allowsCameraControl = YES;
    theSceneView.autoenablesDefaultLighting = YES;
    theSceneView.showsStatistics = YES;
    
//    theMainScene.background.contents = @[@"right_2x.png", @"left_2x.png", @"top_2x.png", @"bottom_2x.png", @"back_2x.png", @"front_2x.png"];
    
    SCNNode *theChildNode = theMainScene.rootNode.childNodes.firstObject;
    for (SCNNode *theNode in theChildNode.childNodes)
    {
        NSLog(@"%@",[theNode.geometry.materials.firstObject.reflective.contents class]);
    }
     NSLog(@"%@",[theChildNode.childNodes.firstObject.childNodes.firstObject.geometry.materials.firstObject.reflective.contents class]);
    
    // Right, Left, Top, Bottom, Front, Back
    NSArray *theImageNamesArray = [NSArray arrayWithObjects:@"right", @"left", @"top", @"bottom", @"front", @"back", nil];
    NSMutableArray *theImagesArray = [NSMutableArray new];
    for (int i = 0; i < theImageNamesArray.count; i++)
    {
        [theImagesArray addObject:[UIImage getImageNamed:theImageNamesArray[i]]];
    }
    theChildNode.childNodes.firstObject.childNodes.firstObject.geometry.materials.firstObject.reflective.contents = theImagesArray;
    theChildNode.childNodes[1].geometry.materials.firstObject.reflective.contents = theImagesArray;
    theChildNode.childNodes[2].geometry.materials.firstObject.reflective.contents = theImagesArray;
}

#pragma mark - Actions

#pragma mark - Gestures

#pragma mark - Notifications

#pragma mark - Delegates ()

#pragma mark - Methods (Public)

#pragma mark - Methods (Private)

#pragma mark - Standard Methods

@end






























