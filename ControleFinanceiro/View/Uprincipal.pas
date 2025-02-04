unit Uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.jpeg,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart;

type
  TFrmPrincipal = class(TForm)
    pnlCabecalho: TPanel;
    pnlPesquisar: TPanel;
    StatusBar1: TStatusBar;
    gpbPainelVencimentos: TGroupBox;
    gpbRelatorioFinanceiro: TGroupBox;
    rgPesquisar: TRadioGroup;
    PopupMenu1: TPopupMenu;
    CadastrarConta1: TMenuItem;
    N1: TMenuItem;
    PagarConta1: TMenuItem;
    lbedtPesquisar: TLabeledEdit;
    N2: TMenuItem;
    LanarConta1: TMenuItem;
    pnlContas: TPanel;
    dbgContasLancadas: TDBGrid;
    pnlTotais: TPanel;
    N3: TMenuItem;
    AtualizarListadeContas1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LanareEditarConta1: TMenuItem;
    LanaremLote1: TMenuItem;
    procedure rgPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CadastrarConta1Click(Sender: TObject);
    procedure dbgContasLancadasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgContasLancadasDblClick(Sender: TObject);
    procedure dbg(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure PagarConta1Click(Sender: TObject);
    procedure AtualizarListadeContas1Click(Sender: TObject);
    procedure LanareEditarConta1Click(Sender: TObject);
    procedure LanaremLote1Click(Sender: TObject);
  private
    procedure DescricaoPesquisar;
    procedure LancarContas;
    procedure CadastrarContas;
    procedure PagarContas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses Ucontas, UlancarContas, UdmPrincipal, UpagtoContas, UlancarContasLote;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Vers�o(Build) ' + FormatDateTime('dd/mm/yyyy' + ' - ' + 'hh:mm', Now) + ' (Desenv. Eduardo Moraes)';
  StatusBar1.Panels[1].Text := dmPrincipal.FDConnection.Params.Values['Database'];
end;

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN : LancarContas;
    VK_F3 : CadastrarContas;
    VK_F4 : LancarContas;
    VK_F5 : PagarContas;
  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  DescricaoPesquisar;
end;

procedure TFrmPrincipal.LanareEditarConta1Click(Sender: TObject);
begin
  LancarContas;
end;

procedure TFrmPrincipal.LanaremLote1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFrmLancamentosLote, FrmLancamentosLote);
    FrmLancamentosLote.ShowModal;
  finally
    FrmLancamentosLote.Free;
  end;
end;

procedure TFrmPrincipal.rgPesquisarClick(Sender: TObject);
begin
  DescricaoPesquisar;
end;

procedure TFrmPrincipal.AtualizarListadeContas1Click(Sender: TObject);
begin
  dmPrincipal.fdqContasLancadas.Refresh;
  Self.dbgContasLancadas.Refresh;
  dmPrincipal.fdqContasLancadas.First;
end;

procedure TFrmPrincipal.CadastrarConta1Click(Sender: TObject);
begin
  CadastrarContas;
end;

procedure TFrmPrincipal.dbgContasLancadasDblClick(Sender: TObject);
begin
  LancarContas;
end;

procedure TFrmPrincipal.dbgContasLancadasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  {alterando a cor da linha atual selecionada}
  if (not dmPrincipal.fdqContasLancadasPAGAMENTO.IsNull) then
    TDBGrid(Sender).Canvas.Brush.Color := clGreen
  else if (dmPrincipal.fdqContasLancadasPAGAMENTO.IsNull) and
          (dmPrincipal.fdqContasLancadasSTATUS.AsInteger = 0) then
    TDBGrid(Sender).Canvas.Brush.Color := clOlive
  else if (dmPrincipal.fdqContasLancadasPAGAMENTO.IsNull) and
          (dmPrincipal.fdqContasLancadasSTATUS.AsInteger < 0) then
    TDBGrid(Sender).Canvas.Brush.Color := clYellow
  else
    TDBGrid(Sender).Canvas.Brush.Color := clRed;
  {atualizando a visualiza��o do DBGrid}
  dbgContasLancadas.Canvas.FillRect(Rect);
    TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFrmPrincipal.dbg(Sender: TObject);
begin
  LancarContas;
end;

procedure TFrmPrincipal.DescricaoPesquisar;
begin
  lbedtPesquisar.EditLabel.Caption := 'Procurar por: ' + rgPesquisar.Items[rgPesquisar.ItemIndex];
end;

procedure TFrmPrincipal.LancarContas;
begin
  try
    Application.CreateForm(TFrmLancarContas, FrmLancarContas);
    FrmLancarContas.ShowModal;
  finally
    Self.dbgContasLancadas.DataSource.DataSet.Refresh;
    Self.dbgContasLancadas.Refresh;
    FrmLancarContas.Free;
  end;
end;

procedure TFrmPrincipal.CadastrarContas;
begin
  try
    Application.CreateForm(TFrmContas, FrmContas);
    FrmContas.Tag := 'C';
    FrmContas.ShowModal;
  finally
    FrmContas.Free;
  end;
end;

procedure TFrmPrincipal.PagarContas;
begin
  try
    Application.CreateForm(TFrmPagto, FrmPagto);
    dmPrincipal.fdqContasLancadas.Edit;
    FrmPagto.ShowModal;
  finally
    if dmPrincipal.fdqContasLancadas.State in [dsEdit] then
    begin
      dmPrincipal.fdqContasLancadas.Cancel;
      dmPrincipal.fdqContasLancadas.Refresh;
    end;
    Self.dbgContasLancadas.DataSource.DataSet.Refresh;
    Self.dbgContasLancadas.Refresh;
    FrmPagto.Free;
  end;
end;

procedure TFrmPrincipal.PagarConta1Click(Sender: TObject);
begin
  PagarContas;
end;

end.
