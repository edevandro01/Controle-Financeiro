unit UlancarContasLote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TFrmLancamentosLote = class(TForm)
    pnlCabecalho: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbTXTInformacao: TDBText;
    Label5: TLabel;
    pnlLancamentoLote: TPanel;
    Label4: TLabel;
    edtQtdMeses: TEdit;
    btnLancamentosLote: TButton;
    procedure btnLancamentosLoteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLancamentosLote: TFrmLancamentosLote;

implementation

{$R *.dfm}

uses UdmPrincipal;

procedure TFrmLancamentosLote.btnLancamentosLoteClick(Sender: TObject);
var
  lQtdMeses,
  I: Integer;
  lData: TDateTime;
begin
  lQtdMeses := StrToInt(edtQtdMeses.Text);

  lData := dmPrincipal.fdqContasLancadasVENCIMENTO.AsDateTime;
  lData := IncMonth(lData);

  for I := 1 to lQtdMeses do
  begin
    if Application.MessageBox(PChar ('Parcela: ' + I.ToString + '[' + DateToStr(lData) + ']'), 'Confirmação', MB_OK + MB_ICONINFORMATION) = mrOk then
      lData := IncMonth(lData);
  end;
end;

end.
