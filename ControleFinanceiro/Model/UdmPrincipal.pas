unit UdmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmPrincipal = class(TDataModule)
    FDConnection: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    fdqProcurar: TFDQuery;
    dsContasLancadas: TDataSource;
    fdqContasLancadas: TFDQuery;
    fdqContasLancadasID: TIntegerField;
    fdqContasLancadasIDCONTA: TIntegerField;
    fdqContasLancadasVENCIMENTO: TDateField;
    fdqContasLancadasPAGAMENTO: TDateField;
    fdqContasLancadasDESCRICAO: TStringField;
    fdqContasLancadasPAGO: TStringField;
    fdqContasLancadasSTATUS: TIntegerField;
    fdqContasLancadasINFORMACAO: TStringField;
    fdqContasLancadasVALORCONTA: TFMTBCDField;
    fdqContasLancadasVALORPAGTO: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
