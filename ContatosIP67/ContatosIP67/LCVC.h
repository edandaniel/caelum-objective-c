//
//  ContactListViewController.h
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"
#import "FCVC.h"

@interface LCVC : UITableViewController <FCVCDelegate>
	@property ContatoDAO* dao;
	@property Contato* selecionado;
	@property LCVC* lista;
    @property NSInteger linhaPintada;
    -(void)exibeForm;
    -(void)highlightNoContato:(Contato*)contato;
@end

