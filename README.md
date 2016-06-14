# INTRO

# Infra
MacMini

## iOS
- iPhone
- iPad
-iPad
-iWatch
-appleTV

## MacOS
- Mac

## how 2 dev
- Xcode
 -SDK

## Lang
- Objective-C / Swift

iOS          | MacOS
---
Cocoa Touch  | Cocoa (unica diferenca entre os 2)
MediaLayer   | MediaLayer
CoreServices | CoreServices
CoreOS       | ∂CoreOS

## Story Time

- Apple MacOS 9
- Steve Jobs demitido
- Cria Empresa Next
- Stepstone
— Biologia
- C com objetos
- Interface Builder
- Steve buys Stepstone, join to Next, become NextStep
- Uncle Steve goes back to Apple

# Xcode

## Storyboard | Interface Builder
- 1 arquivo
- n telas

## xib (Xcode Interface Builder)
- 1 arquivo
- 1 tela

Storyboard fala com xib
programaticamente

## iOS x Android | Simulador x Emulador
iOS: Simulador (faz de conta)
Android: Emulador (mundo real)

# Objective-C 

## .h (header)
cabecalho e definicoes
*publico*

### Comportamento de tela => UIViewController
@interface ViewController : UIViewController
":" -> extends do java (son of a...)
UIViewController é como se fosse Activity do Android

## .m (messages)
@implementation ViewController

### static / non static
- (metodo de instancia) (non static)
+ (static)

## IBAction
Interface Builder Action

## [ ] 
Objective-C trabalha com mensagens, em tempo de execucao
*[* e *]* sao usados para troca de mensagens

## NS
NextStep

## ("string exemplo %@",stringue)
Interpolacao de string

## toda classe deve ser filha de alguem 
nao existe classe sem referencia para pai

## syntax sugar

```ObjectiveC
NSString* email = [self.email text];
NSString* mail = self.mail.text; //funciona assim, mas é dangerous (get, setters e via)
```

[Contato new] => [[Contato alloc] init]
[[self nome] text]

## @property
 cria getter, setter e iVar (variavel de Instancia)

## memory
Java (Garbage colector)
iOS
- In ye olde times, controlar no dedo, contava referencias e limpava quando era 0
- nowadays, ARC controla (Automatic Reference Counting)

## Referencia : strong x weak
strong
- se tem controle do objeto, voce que instanciou e controla quando libera
- voce segura cachorro com a coleira, so foge se voce soltar
weak
- quando voce só usa a referencia, nao conhece quem criou e nao controla quem libera
- voce aponta ao cachorro, nao controla quando ele foge

>"Sempre que você olha uma criança, há sempre uma figura oculta, que é um cachorro atrás, o que é algo muito importante" - Dilma Rouseff

## Arrays
Imutaveis, sempre cria objeto novo com itens anteriores + novos, precisa sempre re-referenciar

verifica classe([var isKindOfClass[NSInteger class]])

## inicializadores
a linguagem nao tem constructors (funciona diferente)
inicializadores comecam com init
classe id = NSObject* , ponteiro de object, palavra reservada
instancetype = id = NSObject*

## variaveis privadas
para acessar, precisa de _nomedaproperty 

## singleton
objective C nao aceita singleton, mas da pra chegar perto

# AppDelegate UI
        application:didFinishLaunchingWithOptions (assinatura)
        application:(UIApplication*)app didFinishLaunchingWithOptions:(NSDictionary*)options (nome do metodo)
            ˆ
			|		      window
iOS -> AppDelegate->(ViewController+View)

é possivel ter uma tela principal antes da app porque é chamada antes a AppDelegate, antes de criar a windows, que é criada pela junçao do view e ViewController

# funcao que recebe 2 parametros
application:(UIApplication*)app didFinishLaunchingWithOptions:(NSDictionary*)options ()

## e.g., funcao divide para calcular 10/5

JAVA

```Java
//declaracao
public int divide(int num1, int num2)
//chamada
divide(10,5)
```
quando se chama, sem documentacao e implentacao nao se sabe como é a chamada, a ordem, funcao nao tem um sentido so com o nome

ObjectiveC

```ObjectiveC
//declaracao
-(int)divide:(int)num1 por:(int)
//chamada
divide:10 por:5
//nome da funcao
divide:por:

//still works, but pls, dont do it, not standart, all of the bad practices
//declaracao
-(int)divide:(int)num1 :(int)
//chamada
divide:10:5
//nome
divide::
```
WHY?
nome do metodo fica como uma frase, cria um sentido (divide:10 por:5)
P.S.
se existir uma funcao divide:por:resto, o ObjectiveC considera uma funcao totalmente diferente, porque o nome muda
BUT, uma funcao com mesmo nome ou outros tipos, (divide:por: porem float:float) da merda, a linguagem acha que as duas sao a mesma, pls dont do it


## UIAlertController
fusao de UI AlertView e UIActionSheet

# downcast
cast automatico de classe mae pra classe filha, nao da problema