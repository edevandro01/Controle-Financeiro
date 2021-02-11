unit Ucontas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmContas = class(TForm)
    pnlButtons: TPanel;
    pnlCadastro: TPanel;
    pnlListagem: TPanel;
    btnNovo: TButton;
    btnAlterar: TButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    dbgListagem: TDBGrid;
    dsListagem: TDataSource;
    fdqListagem: TFDQuery;
    fdqListagemID: TIntegerField;
    fdqListagemDESCRICAO: TStringField;
    Label1: TLabel;
    dbedtDescricao: TDBEdit;
    pnlPesquisar: TPanel;
    rgPesquisar: TRadioGroup;
    edtPesquisar: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure rgPesquisarClick(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure dbgListagemDblClick(Sender: TObject);
  private
    FTag: string;
    FContaDescricao: string;
    FContaCod: Integer;
    procedure HabilitarCadastro;
    procedure DesabilitarCadastro;
    procedure SetTag(const Value: string);
    procedure SetContaCod(const Value: Integer);
    procedure SetContaDescricao(const Value: string);
    { Private declarations }
  public
    property Tag :string read FTag write SetTag;
    property ContaCod :Integer read FContaCod write SetContaCod;
    property ContaDescricao :string read FContaDescricao write SetContaDescricao;
    { Public declarations }
  end;

var
  FrmContas: TFrmContas;

implementation

{$R *.dfm}

uses UdmPrincipal, Umetodos;

procedure TFrmContas.btnAlterarClick(Sender: TObject);
begin
  HabilitarCadastro;
  fdqListagem.Edit;
  dbedtDescricao.Enabled := True;
  dbedtDescricao.SetFocus;
end;

procedure TFrmContas.btnCancelarClick(Sender: TObject);
begin
  DesabilitarCadastro;
  fdqListagem.Cancel;
  dbedtDescricao.Enabled := False;
  btnNovo.SetFocus;
end;

procedure TFrmContas.btnExcluirClick(Sender: TObject);
begin
  try
    if Application.MessageBox(PChar ('Deseja excluir o registro[' + fdqListagemDESCRICAO.AsString + ']'), 'Confirmação', MB_YESNO) = mrYes then
    begin
      fdqListagem.Delete;
      fdqListagem.Refresh;
    end;
  except
    on E: Exception do
      if Application.MessageBox('Não é possivel excluir conta em uso.', 'Atenção', MB_OK) = mrOk then
  end;
end;

procedure TFrmContas.btnNovoClick(Sender: TObject);
begin
  HabilitarCadastro;
  fdqListagem.Append;
  dbedtDescricao.Enabled := True;
  dbedtDescricao.SetFocus;
end;

procedure TFrmContas.btnSalvarClick(Sender: TObject);
begin
  DesabilitarCadastro;
  fdqListagem.Post;
  fdqListagem.Refresh;
  dbedtDescricao.Enabled := False;
  btnNovo.SetFocus;
end;

procedure TFrmContas.dbgListagemDblClick(Sender: TObject);
begin
  if Self.Tag = 'P' then
  begin
    Self.ContaCod       := fdqListagemID.AsInteger;
    Self.ContaDescricao := fdqListagemDESCRICAO.AsString;
    ModalResult := mrOk;
  end;

end;

procedure TFrmContas.HabilitarCadastro;
begin
  btnNovo.Enabled := False;
  btnAlterar.Enabled := False;
  btnCancelar.Enabled := True;
  btnSalvar.Enabled := True;
  btnExcluir.Enabled := False;
  pnlPesquisar.Enabled := False;
end;

procedure TFrmContas.rgPesquisarClick(Sender: TObject);
begin
  edtPesquisar.Clear;
  edtPesquisar.SetFocus;
end;

procedure TFrmContas.SetContaCod(const Value: Integer);
begin
  FContaCod := Value;
end;

procedure TFrmContas.SetContaDescricao(const Value: string);
begin
  FContaDescricao := Value;
end;

procedure TFrmContas.SetTag(const Value: string);
begin
  FTag := Value;
end;

procedure TFrmContas.DesabilitarCadastro;
begin
  btnNovo.Enabled := True;
  btnAlterar.Enabled := True;
  btnCancelar.Enabled := False;
  btnSalvar.Enabled := False;
  btnExcluir.Enabled := True;
  pnlPesquisar.Enabled := True;
end;

procedure TFrmContas.edtPesquisarChange(Sender: TObject);
begin
  if rgPesquisar.ItemIndex = 0 then
  begin
    edtPesquisar.NumbersOnly := True;
    if Trim(edtPesquisar.Text)<> '' then
      PesqLocate(fdqListagem, edtPesquisar, 'Id');
  end
  else
  begin
    edtPesquisar.NumbersOnly := False;
    PesqLocate(fdqListagem, edtPesquisar, 'Descricao');
  end;
end;

procedure TFrmContas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  fdqListagem.Close;
end;

procedure TFrmContas.FormCreate(Sender: TObject);
begin
  fdqListagem.Open;
end;

end.
