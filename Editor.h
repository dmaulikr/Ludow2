//
//  Editor.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GameBox;

@interface Editor : NSManagedObject

@property (nonatomic, retain) NSString * editorName;
@property (nonatomic, retain) NSSet *editorBG;
@end

@interface Editor (CoreDataGeneratedAccessors)

- (void)addEditorBGObject:(GameBox *)value;
- (void)removeEditorBGObject:(GameBox *)value;
- (void)addEditorBG:(NSSet *)values;
- (void)removeEditorBG:(NSSet *)values;

@end
