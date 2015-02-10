unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.StdCtrls, FMX.WebBrowser, FMX.ListView, FMX.TabControl,
  IPPeerClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, REST.Client,
  Data.Bind.ObjectScope, System.Actions, FMX.ActnList;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ListView1: TListView;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    Label1: TLabel;
    WebBrowser1: TWebBrowser;
    Label2: TLabel;
    Button2: TButton;
    Button1: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    LinkPropertyToFieldText: TLinkPropertyToField;
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  // �� ����(�� ����) �� �Ǽ����� ���߰� ù��° �� ǥ��
  TabControl1.TabPosition := TTabPosition.None;
  TabControl1.TabIndex := 0;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // ���Ź�ư Ŭ�� �� ��û ����
  RESTRequest1.Execute;
end;

procedure TForm1.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  // ����� ������ ����(Ŭ��) �� URL���� �� �������� ����
  WebBrowser1.URL := AItem.Detail;
  WebBrowser1.Navigate;
  WebBrowser1.Visible := True;

  // 2��° ��(�󼼺���)�� �̵�
  ChangeTabAction1.Tab := TabItem2;
  ChangeTabAction1.ExecuteTarget(nil);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  // < ��ư Ŭ�� �� 1��° ��(���)���� �̵�
  WebBrowser1.Visible := False;
  ChangeTabAction1.Tab := TabItem1;
  ChangeTabAction1.ExecuteTarget(nil);
end;


end.
