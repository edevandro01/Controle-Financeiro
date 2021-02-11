unit UpagtoContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.WinXCalendars;

type
  TFrmPagto = class(TForm)
    pnlRealizarPagto: TPanel;
    Label6: TLabel;
    dbedtPagto: TDBEdit;
    Label4: TLabel;
    calendarValor: TCalendarView;
    pnlCabecalho: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbTXTInformacao: TDBText;
    Label5: TLabel;
    btnPagar: TButton;
    edtValorPago: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure edtValorPagoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPagto: TFrmPagto;

implementation

{$R *.dfm}

uses UdmPrincipal;

procedure TFrmPagto.btnPagarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar ('Conta paga com sucesso'), 'Confirmação', MB_OK) = mrOk then
  begin
    dmPrincipal.fdqContasLancadasPAGO.AsString := 'P';
    dmPrincipal.fdqContasLancadasVALORPAGTO.AsVariant := edtValorPago.Text;
    dmPrincipal.fdqContasLancadas.Post;
    Self.Close;
  end;
end;

procedure TFrmPagto.edtValorPagoExit(Sender: TObject);
begin
  edtValorPago.Text := FormatFloat('###,##0.00', StrToFloat(edtValorPago.Text));
end;

procedure TFrmPagto.FormShow(Sender: TObject);
begin
  dbedtPagto.Text := DateToStr(Now);
  edtValorPago.Text := dmPrincipal.fdqContasLancadasVALORCONTA.AsString;
  edtValorPagoExit(Sender);
  btnPagar.SetFocus;
  if dmPrincipal.fdqContasLancadasPAGO.AsVariant = 'P' then
  begin
    dbTXTInformacao.Font.Color := clGreen;
    Self.btnPagar.Visible := False;
    Self.edtValorPago.Enabled := False;
    Self.calendarValor.Enabled := False;
  end;
end;

end.
