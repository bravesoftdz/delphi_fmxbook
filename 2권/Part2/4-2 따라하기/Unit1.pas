unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, System.Actions, FMX.ActnList, FMX.TabControl,
  FMX.StdCtrls, FMX.ListView, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  FMX.WebBrowser, Xml.omnixmldom;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ListView1: TListView;
    ToolBar2: TToolBar;
    Label2: TLabel;
    Button2: TButton;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Button1: TButton;
    WebBrowser1: TWebBrowser;
    XMLDocument1: TXMLDocument;
    IdHTTP1: TIdHTTP;
    procedure Button2Click(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
  XmlData, title, link: string;
  I: Integer;
  Node, ItemNode: IXMLNode;
  ListViewItem: TListViewItem;
begin
  // IdHTTP ������Ʈ�� ���� ����ڷḦ ���ڿ�(string)�� �޾ƿɴϴ�.
  XmlData := IdHTTP1.Get('http://tech.devgear.co.kr/delphi_news/rss');
  // XML�м� ������Ʈ���� XML �����͸� �ҷ��ɴϴ�.
  XMLDocument1.LoadFromXML(XmlData);
  XMLDocument1.Active := True;

  // channel ��带 ã���ϴ�.
  Node := XMLDocument1.DocumentElement.ChildNodes.FindNode('channel');
  for I := 0 to Node.ChildNodes.Count - 1 do
  begin
    ItemNode := Node.ChildNodes.Get(I);
    // �ڽ� ��尡 item�� �׸��� title, link �� ���
    if ItemNode.NodeName = 'item' then
    begin
      title := ItemNode.ChildValues['title'];
      link := ItemNode.ChildValues['link'];
      ListViewItem := ListView1.Items.Add;
      ListViewItem.Text := title;
      ListViewItem.Detail := link;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // �� ����(�� ����) �� �Ǽ����� ���߰� ù�� �� ǥ��
  TabControl1.TabPosition := TTabPosition.None;
  TabControl1.TabIndex := 0;
end;

procedure TForm1.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  // ��� ������ ����(Ŭ��) �� ������ ����, �������� URL ���� �� ����
  Label2.Text := AItem.Text;
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
