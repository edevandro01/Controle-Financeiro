unit Umetodos;

interface

uses
  FireDAC.Comp.Client, Vcl.StdCtrls, System.UITypes;

  procedure PesqLocate(cds:TFDQuery; edtPesq:TEdit; campoPesq:string);
  function Selecionar(pTabela, pCampo, pFiltro:string):string;
  function ValidaInteger(const num: string ): Boolean;

implementation

uses
  Data.DB, System.SysUtils, UdmPrincipal, Vcl.Dialogs;

procedure PesqLocate(cds:TFDQuery; edtPesq:TEdit; campoPesq:string);
begin
  cds.Locate(campoPesq, edtPesq.Text,[loPartialKey, loCaseInsensitive]);
  cds.Filtered := False;
  cds.Filter := 'UPPER(' + campoPesq + ') LIKE' + UpperCase(QuotedStr('%'+ Trim(edtPesq.Text) + '%'));
  cds.Filtered := True;
end;

function Selecionar(pTabela, pCampo, pFiltro: string): string;
begin
  try
    dmPrincipal.fdqProcurar.SQL.Clear;
    dmPrincipal.fdqProcurar.SQL.Add('select * from ' + pTabela + ' where ' + pCampo + ' = ' + pFiltro);
    dmPrincipal.fdqProcurar.Open;

    if not dmPrincipal.fdqProcurar.IsEmpty then
      Result := dmPrincipal.fdqProcurar.Fields[1].AsString
    else
      MessageDlg('Registro não foi encontrado', mtInformation,[mbOk],0);

  finally
    dmPrincipal.fdqProcurar.Close;
  end;
end;

function ValidaInteger(const num: string ): Boolean;
var
  ret:Integer;
begin
  Result := TryStrToInt(num, ret);
end;

end.
