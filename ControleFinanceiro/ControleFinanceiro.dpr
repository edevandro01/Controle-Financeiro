program ControleFinanceiro;

uses
  Vcl.Forms,
  Uprincipal in 'View\Uprincipal.pas' {FrmPrincipal},
  Ucontas in 'View\Ucontas.pas' {FrmContas},
  UdmPrincipal in 'Model\UdmPrincipal.pas' {dmPrincipal: TDataModule},
  UlancarContas in 'View\UlancarContas.pas' {FrmLancarContas},
  Umetodos in 'Util\Umetodos.pas',
  UpagtoContas in 'View\UpagtoContas.pas' {FrmPagto},
  UlancarContasLote in 'View\UlancarContasLote.pas' {FrmLancamentosLote};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
