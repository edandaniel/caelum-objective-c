//
//  ContactListViewController.h
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"
#import "ContactFormViewController.h"

@interface ContactListViewController : UITableViewController <CFVCDelegate>
	@property ContatoDAO* dao;
	@property Contato* selecionado;
	@property (weak) id<CFVCDelegate> delegate;
	//@property ContactListViewController* lista;
    @property NSInteger linhaPintada;
-(void)abreForm;
    //-(void) highlightNoContato:(Contato*)contato;
@end

