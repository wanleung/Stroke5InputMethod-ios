//
//  KeyboardViewController.m
//  Stroke5Keyboard
//
//  Created by Wan Leung Wong on 30/6/14.
//  Copyright (c) 2014 Wan Leung Wong. All rights reserved.
//

#import "KeyboardViewController.h"

#import "Stroke5Database.h"
#import "KeyButton.h"

@interface KeyboardViewController () {
    NSMutableArray *wordButtonArray;
    UIButton *nextButton;
    UIButton *periousButton;
}
@property (nonatomic, strong) UIButton *nextKeyboardButton;
@end

@implementation KeyboardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Perform custom initialization work here
    }
    return self;
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Stroke5Database database];
    
    // Perform custom UI setup here
    self.nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.nextKeyboardButton setTitle:NSLocalizedString(@"Next Keyboard", @"Title for 'Next Keyboard' button") forState:UIControlStateNormal];
    [self.nextKeyboardButton sizeToFit];
    self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.nextKeyboardButton addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.nextKeyboardButton];
    
    //UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //button1.frame = CGRectMake(0, 0, 20, 20);
    //[button1 setTitle:@"A" forState:UIControlStateNormal];
    //[button1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:button1];
    
    
    NSLayoutConstraint *nextKeyboardButtonLeftSideConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *nextKeyboardButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self.view addConstraints:@[nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint]];
    
    [self initKeyboardView];
}

- (void)initKeyboardView {
    CGSize mySize = self.view.frame.size;
    KeyButton *a = [[KeyButton alloc] initWithFrame:CGRectMake(0, -40, 40, 40)];
    [a setTitle:@"A" forState:UIControlStateNormal];
    [self.view addSubview:a];
    //UIButton *
}

- (void)initWordButtonView {
    wordButtonArray = [[NSMutableArray alloc] init];
    nextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    periousButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    for (int i = 0; i < 5; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [wordButtonArray addObject:button];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
    NSLog(@"1 %@", textInput);
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    [self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
    NSLog(@"2 %@", textInput);
}

- (void)buttonClick:(id)sender {
    NSLog(@"3 %@", [self.textDocumentProxy documentContextBeforeInput]);
    NSLog(@"4 %@", [self.textDocumentProxy documentContextAfterInput]);
    NSArray *data = [[Stroke5Database database] stroke5Char:@"/m/m*"];
    //NSLog(@"%@", data);
    NSArray *phase = [[Stroke5Database database] phase:[data objectAtIndex:0]];
    [self.textDocumentProxy insertText:[data objectAtIndex:0]];
    [self.textDocumentProxy insertText:[phase objectAtIndex:0]];
}

- (void)wordButtonClick:(id)sender {
    
}

- (void)nextButtonClick:(id)sender {
    
}

- (void)previousButtonClick:(id)sender {
    
}

@end
