object FrmPagto: TFrmPagto
  Left = 0
  Top = 0
  ActiveControl = btnPagar
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pagamento de Contas'
  ClientHeight = 417
  ClientWidth = 919
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRealizarPagto: TPanel
    Left = 0
    Top = 136
    Width = 919
    Height = 281
    Align = alBottom
    Color = clInfoBk
    ParentBackground = False
    TabOrder = 0
    object Label6: TLabel
      Left = 337
      Top = 30
      Width = 157
      Height = 24
      Caption = 'Data Pagamento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 20
      Top = 30
      Width = 103
      Height = 24
      Caption = 'Valor Pago:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbedtPagto: TDBEdit
      Left = 495
      Top = 27
      Width = 131
      Height = 32
      TabStop = False
      DataField = 'PAGAMENTO'
      DataSource = dmPrincipal.dsContasLancadas
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object calendarValor: TCalendarView
      Left = 647
      Top = 1
      Width = 271
      Height = 279
      Align = alRight
      Date = 44229.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      HeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
      HeaderInfo.DaysOfWeekFont.Color = clWindowText
      HeaderInfo.DaysOfWeekFont.Height = -13
      HeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
      HeaderInfo.DaysOfWeekFont.Style = []
      HeaderInfo.Font.Charset = DEFAULT_CHARSET
      HeaderInfo.Font.Color = clWindowText
      HeaderInfo.Font.Height = -20
      HeaderInfo.Font.Name = 'Segoe UI'
      HeaderInfo.Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object btnPagar: TButton
      Left = 20
      Top = 208
      Width = 606
      Height = 57
      Caption = 'Confirmar Pagamento - F8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnPagarClick
    end
    object edtValorPago: TEdit
      Left = 129
      Top = 27
      Width = 192
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnExit = edtValorPagoExit
    end
  end
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 919
    Height = 136
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
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
end
