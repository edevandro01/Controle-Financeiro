object FrmLancamentosLote: TFrmLancamentosLote
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amento de Contas em Lote'
  ClientHeight = 356
  ClientWidth = 888
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 888
    Height = 129
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object DBText1: TDBText
      Left = 73
      Top = 40
      Width = 304
      Height = 25
      Align = alCustom
      DataField = 'DESCRICAO'
      DataSource = dmPrincipal.dsContasLancadas
    end
    object DBText2: TDBText
      Left = 444
      Top = 40
      Width = 190
      Height = 17
      DataField = 'VALORCONTA'
      DataSource = dmPrincipal.dsContasLancadas
    end
    object DBText3: TDBText
      Left = 744
      Top = 40
      Width = 105
      Height = 17
      Alignment = taCenter
      DataField = 'VENCIMENTO'
      DataSource = dmPrincipal.dsContasLancadas
    end
    object Label1: TLabel
      Left = 20
      Top = 40
      Width = 47
      Height = 19
      Caption = 'Conta:'
    end
    object Label2: TLabel
      Left = 392
      Top = 40
      Width = 43
      Height = 19
      Caption = 'Valor:'
    end
    object Label3: TLabel
      Left = 658
      Top = 40
      Width = 89
      Height = 19
      Caption = 'Vencimento:'
    end
    object dbTXTInformacao: TDBText
      Left = 133
      Top = 96
      Width = 416
      Height = 25
      Align = alCustom
      DataField = 'INFORMACAO'
      DataSource = dmPrincipal.dsContasLancadas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 20
      Top = 96
      Width = 108
      Height = 24
      Caption = 'Informa'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlLancamentoLote: TPanel
    Left = 0
    Top = 129
    Width = 888
    Height = 227
    Align = alClient
    Color = clInfoBk
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 127
    ExplicitHeight = 194
    object Label4: TLabel
      Left = 107
      Top = 48
      Width = 535
      Height = 24
      Caption = 'Informe a quantidade de meses para gerar os lan'#231'amentos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtQtdMeses: TEdit
      Left = 648
      Top = 45
      Width = 121
      Height = 32
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
    end
    object btnLancamentosLote: TButton
      Left = 140
      Top = 121
      Width = 606
      Height = 57
      Caption = 'Confirmar Lan'#231'amentos em Lote - F8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnLancamentosLoteClick
    end
  end
end
