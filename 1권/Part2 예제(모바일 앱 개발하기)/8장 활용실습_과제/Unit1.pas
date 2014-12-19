unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox, FMX.Layouts, FMX.StdCtrls, FMX.Effects,
  FMX.Objects;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    MenuTimer: TTimer;
    ShadowEffect1: TShadowEffect;
    Layout1: TLayout;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBoxItem1Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure ListBoxItem3Click(Sender: TObject);
    procedure ListBoxItem4Click(Sender: TObject);
    procedure MenuTimerTimer(Sender: TObject);
    procedure Layout1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  FMX.Ani;

// ���ʿ� �Ⱥ��̰� �ϱ�.
procedure TForm1.FormCreate(Sender: TObject);
begin
  ListBox1.Position.Point := PointF( Form1.ClientWidth , 0 );  // ������ ����
end;

// ����/���θ�� ��ȯ�� �˾��޴� ����ġ
procedure TForm1.FormResize(Sender: TObject);
begin
  ListBox1.Tag := 0;
  ListBox1.Position.Point := PointF( Form1.ClientWidth , 0 );  // ������ ����
end;

// �޴� ��Ÿ��.
procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  // ShadowEffect ȿ�� ��ݿ�.
   ListBox1.ApplyStyleLookup();
   ListBox1.RealignContent();

   if ListBox1.Tag = 0 then
   begin
     ListBox1.Tag := 1;
     TAnimator.AnimateFloat(ListBox1, 'Position.X', Form1.ClientWidth - ListBox1.Width, 1  );  // ��Ÿ��
   end
   else
   begin
     ListBox1.Tag := 0;
     TAnimator.AnimateFloat(ListBox1, 'Position.X', Form1.ClientWidth, 1  );                   // ������
   end;
end;

// �ٸ� ȭ�� ��ġ�� �˾��޴� ����
procedure TForm1.Layout1Click(Sender: TObject);
begin
   if ListBox1.Tag = 1 then
   begin
     ListBox1.Tag := 0;
     TAnimator.AnimateFloat(ListBox1, 'Position.X', Form1.ClientWidth, 1  );
   end;
end;


// ���޴��� ���� ��� ����
procedure TForm1.ListBoxItem1Click(Sender: TObject);
begin
  Label1.Text := '111';
  ShowMessage( ListBoxItem1.Text );
end;

procedure TForm1.ListBoxItem2Click(Sender: TObject);
begin
  Label1.Text := '222';
end;

procedure TForm1.ListBoxItem3Click(Sender: TObject);
begin
  Label1.Text := '333';
end;

procedure TForm1.ListBoxItem4Click(Sender: TObject);
begin
  Label1.Text := '444';
  MenuTimer.Enabled := TRUE;
end;

// �ȵ���̵��� ��� ListBox ���û��°� �ٷ� ȭ�鿡 ��Ÿ���� �ʾ� ������ �ΰ� ����ó����.
procedure TForm1.MenuTimerTimer(Sender: TObject);
begin
  MenuTimer.Enabled := FALSE;
  ShowMessage( ListBox1.Selected.Text );
end;




end.
