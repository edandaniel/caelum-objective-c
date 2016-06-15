//
//  LISTA CONTATO VIEW CONTROLLER
//  LCVC
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"
#import "FCVC.h"
#import "GerenciadorDeAcoes.h"

@interface LCVC : UITableViewController <FCVCDelegate,UIActionSheetDelegate>
	@property ContatoDAO* dao;
	@property Contato* selecionado;
	@property LCVC* lista;
    @property NSInteger linhaPintada;
    @property (readonly) GerenciadorDeAcoes* gerenciador;
    -(void)exibeForm;
@end

