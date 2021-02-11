object FrmContas: TFrmContas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Contas'
  ClientHeight = 508
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 802
    Height = 90
    Align = alTop
    TabOrder = 0
    object btnNovo: TButton
      Left = 65
      Top = 26
      Width = 129
      Height = 40
      Caption = 'Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TButton
      Left = 200
      Top = 25
      Width = 129
      Height = 40
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnCancelar: TButton
      Left = 335
      Top = 25
      Width = 129
      Height = 40
      Caption = 'Cancelar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnSalvar: TButton
      Left = 470
      Top = 25
      Width = 129
      Height = 40
      Caption = 'Salvar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object btnExcluir: TButton
      Left = 605
      Top = 25
      Width = 129
      Height = 40
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnExcluirClick
    end
  end
  object pnlCadastro: TPanel
    Left = 0
    Top = 90
    Width = 802
    Height = 60
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 10
      Top = 7
      Width = 60
      Height = 16
      Caption = 'Descri'#231#227'o:'
      FocusControl = dbedtDescricao
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbedtDescricao: TDBEdit
      Left = 10
      Top = 26
      Width = 781
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = dsListagem
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnlListagem: TPanel
    Left = 0
    Top = 210
    Width = 802
    Height = 298
    Align = alClient
    TabOrder = 3
    object dbgListagem: TDBGrid
      Left = 1
      Top = 1
      Width = 800
      Height = 296
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsListagem
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgListagemDblClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o Conta'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 641
          Visible = True
        end>
    end
  end
  object pnlPesquisar: TPanel
    Left = 0
    Top = 150
    Width = 802
    Height = 60
    Align = alTop
    TabOrder = 1
    object rgPesquisar: TRadioGroup
      Left = 3
      Top = 6
      Width = 262
      Height = 47
      Caption = 'Procurar por'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ParentFont = False
      TabOrder = 0
      OnClick = rgPesquisarClick
    end
    object edtPesquisar: TEdit
      Left = 271
      Top = 24
      Width = 520
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      OnChange = edtPesquisarChange
    end
  end
  object dsListagem: TDataSource
    DataSet = fdqListagem
    Left = 96
    Top = 340
  end
  object fdqListagem: TFDQuery
    Connection = dmPrincipal.FDConnection
    SQL.Strings = (
      'select * from contas')
    Left = 352
    Top = 340
    object fdqListagemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdqListagemDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 250
    end
  end
end
