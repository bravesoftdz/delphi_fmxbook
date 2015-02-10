unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Layouts, FMX.StdCtrls, FMX.Platform;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Button1: TButton;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{$IFDEF ANDROID}
// �ȵ���̵�� ������(Target Platforms > Android)�ϴ� ��츸 �Ʒ� �ڵ带 ���
uses
  Androidapi.Jni.Os, Androidapi.Helpers;
{$ENDIF}
{$IFDEF IOS}
// iOS�� ������(Target Platforms > iOS Device/Simulator)�ϴ� ��츸 �Ʒ� �ڵ带 ���
uses
  iOSapi.UIKit, Macapi.Helpers;
{$ENDIF}

{$R *.fmx}

{$IFDEF ANDROID}
function GetAndroidCodename(VerString: string): string;
var
  iVer: Single;
begin
  if TryStrToFloat(VerString, iVer) then
  begin
    if iVer >= 5.0 then       Result := '�Ѹ���'
    else if iVer >= 4.4 then  Result := 'ŶĹ'
    else if iVer >= 4.1 then  Result := '������'
    else if iVer >= 4.0 then  Result := '���̽�ũ��������ġ'
    else if iVer >= 3.0 then  Result := '�����'
    else if iVer >= 2.3 then  Result := '�����귡��'
    else if iVer >= 2.2 then  Result := '���ο�'
    else                      Result := 'Unkown';
  end
  else
    Result := 'Unkown';
end;
{$ENDIF}

procedure TForm1.Button1Click(Sender: TObject);
begin
// ����, OS����, OS���� ǥ��
{$IFDEF ANDROID}
  ListBoxItem1.ItemData.Detail := JStringToString(TJBuild.JavaClass.MODEL);
  ListBoxItem2.ItemData.Detail := GetAndroidCodename(JStringToString(TJBuild_VERSION.JavaClass.RELEASE));
  ListBoxItem3.ItemData.Detail := JStringToString(TJBuild_VERSION.JavaClass.RELEASE);
{$ENDIF}
{$IFDEF IOS}
  ListBoxItem1.ItemData.Detail := NSStrToStr(Device.systemName);
  ListBoxItem2.ItemData.Detail := NSStrToStr(Device.systemVersion);
  ListBoxItem3.ItemData.Detail := NSStrToStr(Device.model);
{$ENDIF}
end;

// ���� OnKeyUp �̺�Ʈ���� �ϵ���� ���ư�� ������ �� �ִ�.
procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
{$IFDEF ANDROID}
  if Key = vkHardwareBack then
  begin
    ShowMessage('�ȵ���̵� ���ư�� �������ϴ�.');
    Key := 0;
  end;
{$ENDIF}
end;

end.
