unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, TeEngine, Series,
  TeeProcs, Chart, Menus;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    CheckBox1: TCheckBox;
    GroupBox4: TGroupBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    ComboBox2: TComboBox;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    ComboBox3: TComboBox;
    Label5: TLabel;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    Button2: TButton;
    GroupBox6: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    Series1: TLineSeries;
    Chart1: TChart;
    Min: TLabel;
    Max: TLabel;
    ComboBox4: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox5: TComboBox;
    Edit7: TEdit;
    Edit8: TEdit;
    UpDown5: TUpDown;
    UpDown6: TUpDown;
    Edit9: TEdit;
    Edit10: TEdit;
    UpDown7: TUpDown;
    UpDown8: TUpDown;
    Timer2: TTimer;
    Timer1: TTimer;
    Timer3: TTimer;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure view_gen(stp:boolean;fl:byte;Sender: TObject);
    procedure view_os(stp:boolean;Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
DR=100;                              // ���� ��������� (���������� ����� �� ��� x)

var
  Form1: TForm1;
    mant_f,                          // ������� �������
    mant_a_s,                        // ������� ��������� ���������
    mant_a_t,                        // ������� ��������� ������������ �������
    mant_a,                          // ������� ���������
    mant_t,                          // ������� ���������
    
    freq,                            // ���������� �������
    amp_s,                           // ���������� ��������� �����.
    faz,                             // ���������� ���� ������
    amp_t,                           // ���������� ��������� �����.

    y_sin,                           // ��������� ���������� ��������������� �
    y_t,                             // ������������ �������
    y_out,                           // �������� ���������� ����������
    t,                               // ���������� ������������� ���������� (��� ���.)
    tt,                              // ���������� ������������� ���������� (��� �����.)
    x,                               // ���������� ��������� ������������
    dt,                              // �����(����������) ����� ������� �� ������� (�������� ���� �� ��� x)
    sum                              // ������������� ����������
    :extended;
    i:integer;                       // ���������� �������
// �����
    fl_1,                            // ���� ���\���� ����������
    fl_2,                            // ���� ���\���� ������������
    fl_3,                            // ���� ������ ����� ������ ��� �������� ������ �������� � ���� ������������
    fl_4,                            // ����b ������ ����� ������ ��� �������� ������ �������� � ���� ����������
    fl_5                             //
    :boolean;
    tempfile: TextFile;              // �������� ���������� (������������ ��� �������� ������ �� ��������� �����)
    k:integer; // �������
implementation

{$R *.dfm}

procedure Tform1.view_gen(stp:boolean;fl:byte;Sender: TObject);      // ��������� ���������� ����� ����� ����������
begin                                                                // ������ stp ���/���� ����
if stp then                                                          // fl ���� 0- �������
begin                                                                //         1- �����
  if fl=0 then                                                       //         2- �����������
  begin
  Label1.Enabled:=False;
  Edit1.Enabled:=False;                                              // ���������� //
  UpDown1.Enabled:=False;
  ComboBox1.Enabled:=False;
  end;
  if fl=1 then
  begin
    Label2.Enabled:=False;
    Label3.Enabled:=False;
    Label4.Enabled:=False;
    Edit2.Enabled:=False;
    Edit3.Enabled:=False;
    UpDown2.Enabled:=False;
    UpDown3.Enabled:=False;
    ComboBox2.Enabled:=False;
  end;
  if fl=2 then
  begin
    Label5.Enabled:=False;
    Edit4.Enabled:=False;
    UpDown4.Enabled:=False;
    ComboBox3.Enabled:=False;
  end;
end else                                                              ///////////////
begin                                                                 // ��������� //
  if fl=0 then                                                        // �������
  begin
  Label1.Enabled:=True;
  Edit1.Enabled:=True;
  UpDown1.Enabled:=True;
  ComboBox1.Enabled:=True;
  end;
  if fl=1 then                                                        // �����
  begin
    Label2.Enabled:=True;
    Label3.Enabled:=True;
    Label4.Enabled:=True;
    Edit2.Enabled:=True;
    Edit3.Enabled:=True;
    UpDown2.Enabled:=True;
    UpDown3.Enabled:=True;
    ComboBox2.Enabled:=True;
  end;
  if fl=2 then
  begin                                                              // �����������
    Label5.Enabled:=True;
    Edit4.Enabled:=True;
    UpDown4.Enabled:=True;
    ComboBox3.Enabled:=True;
  end;
end;
end;

procedure Tform1.view_os(stp:boolean;Sender: TObject);       // ��������� ���������� ����� �����������
begin                                                        // ������ stp ���/���� ����
if stp then
begin
  button3.Enabled:=False;
  button4.Enabled:=False;
end else
begin
  button3.Enabled:=True;
  button4.Enabled:=True;
end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
case ComboBox1.ItemIndex of // � ������������ �� ��������� ������� ��������
  0: mant_f:=1;             // ComboBox1 ����������� �������� ������� �������
  1: mant_f:=1000;
  2: mant_f:=1000000;
end;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
case ComboBox2.ItemIndex of   // � ������������ �� ��������� ������� ��������
  0: mant_a_s:=0.000001;      // ComboBox2 ����������� �������� ������� ���������
  1: mant_a_s:=0.001;         // ��������������� �������
  2: mant_a_s:=1;
  3: mant_a_s:=1000;
  4: mant_a_s:=1000000;
end;
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin
case ComboBox3.ItemIndex of   // � ������������ �� ��������� ������� ��������
  0: mant_a_t:=0.000001;      // ComboBox3 ����������� �������� ������� ���������
  1: mant_a_t:=0.001;         // ����������� �������
  2: mant_a_t:=1;
  3: mant_a_t:=1000;
  4: mant_a_t:=1000000;
end;
end;

procedure TForm1.ComboBox4Change(Sender: TObject);
begin
case ComboBox4.ItemIndex of   // � ������������ �� ��������� ������� ��������
  0: mant_t:=0.000001;        // ComboBox4 ����������� �������� �������
  1: mant_t:=0.001;           // ���������
  2: mant_t:=1;
end;
end;


procedure TForm1.ComboBox5Change(Sender: TObject);
begin
case ComboBox5.ItemIndex of   // � ������������ �� ��������� ������� ��������
  0: mant_a:=0.000001;        // ComboBox5 ����������� �������� �������
  1: mant_a:=0.001;           // ���������
  2: mant_a:=1;
  3: mant_a:=1000;
  4: mant_a:=1000000;
end;
end;


procedure TForm1.Timer2Timer(Sender: TObject);
var                    
Axsc_t_max:extended;
begin
  Axsc_t_max:=StrToFloat(Edit8.Text);                 // ��������� ��������� ��������� �������� ��� ��� �

  chart1.Serieslist[0].AddXY(x,y_out/mant_a);         // ���������� �����
// ������ ��������� ������
  write(tempfile, x:10:5);                            // ������ �� ��������� ����: �������,
  write(tempfile,'    ');                               // �������,
  writeln(tempfile, y_out/mant_a:10:5);               // ���������  � ������ �� ����� ������
/////////////////////////

// ���������
  x:=x+dt/mant_t;                                     // �������� ����� �� ��� � �� �������� ����
  if x>Axsc_t_max then
  begin
    x:=0;
    Chart1.SeriesList[0].Clear;                       // ������� �������
    Rewrite(tempfile);                                // ������� ���������� �����
  end;
////////

end;

procedure TForm1.Button1Click(Sender: TObject);
var
x:Single;
begin

// ���������� ���/���� ���������� ����� �������
  if fl_1 then                             // �������� �����
  begin                                    // ��������� ���� �� ������� //
    if not( TryStrToFloat(Edit1.Text, x) and                              // �������� ����� ����� �� ������������
    TryStrToFloat(Edit2.Text, x) and  TryStrToFloat(Edit3.Text, x) and
    TryStrToFloat(Edit4.Text, x)) then
    ShowMessage('������ �����������')
    else
    begin

    freq:=StrToFloat(Edit1.Text)*mant_f;   // ��������� �������
    amp_s:=StrToFloat(Edit2.Text)*mant_a_s;// ��������� ��������� ������
    faz:=StrToFloat(Edit3.Text);           // ��������� ���� ������
    amp_t:=StrToFloat(Edit4.Text)*mant_a_t;// ��������� ��������� ������������
    dt:=1/(Freq*DR);                       // ����������� ������������ ��������

    // �������������� ����������
    t:=0;
    tt:=0;
    y_sin:=0;
    y_t:=amp_t;
    y_out:=0;
    sum:=0;
    i:=0;                                
    ////////
// ����������� ����� �����
    view_gen(True,0,Sender);               // ���������� ����������� ����� ������� (0)
    if checkbox1.Enabled then              // �������� ���\���� ����� ���.
       view_gen(True,1,Sender);            // ���������� ����������� ����� ���.(1)
    if checkbox2.Enabled then              // �������� ���\���� ����� ���.
       view_gen(True,2,Sender);            // ���������� ����������� ����� �����.(2)
////////////////////////////

    timer1.Enabled:=True;                  // �������� ���������
    fl_1:=False;                           // �������� �������� �����

    Edit5.Text:='0';                       // ������� ��������, ��� ���� �������� �������� �������� ��� ����� ����, ��� ��� ��� ������� ���������� ������������ ��� ����������
    end
  end else                                 // ��������� ���� �������    //
  begin
    timer1.Enabled:=False;                 // ��������� ���������
    Edit5.Text:='';                        // ������� ���� ������ �������� � �� ��������
    Edit6.Text:='';                        //
    y_out:=0;                              // 0 �� ������ ����������
    fl_1:=True;                            // �������� �������� �����
    view_gen(False,0,Sender);              // ��������� ����������� ����� ������� (0)
    view_gen(False,1,Sender);              // ��������� ����������� ����� ���. (1)
    view_gen(False,2,Sender);              // ��������� ����������� ����� �����. (2)
  end;
//////////////////////////

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  kv,sk:extended;                      // �������������� ����������
  x:Single;
begin

 if  Not CheckBox1.Checked then              // ����� ���������� ��������������� ������� ���� �� �� �������
    begin
      t:=0;
      y_sin:=0;
      view_gen(False,1,Sender);              // ��������� ����������� ����� ���. (1)
      // �������� �������� ������
      if not (TryStrToFloat(Edit2.Text, x) and TryStrToFloat(Edit3.Text, x))then
      begin
      if fl_4 then                           // ��� ���� ��� �� �������� ���� ������ ����� 1 ��� (� ��������� ������ ����������� ����� ���)
      begin
        fl_4:=False;
        ShowMessage('������ �����������');
      end;
      end else
      begin
      fl_4:=True;
      amp_s:=StrToFloat(Edit2.Text)*mant_a_s;// ��������� ��������� ������
      faz:=StrToFloat(Edit3.Text);           // ��������� ���� ������
      end;
    end;

 if  Not CheckBox2.Checked then              // ����� ���������� ������������ ������� ���� �� �� �������
    begin
      tt:=0;
      y_t:=amp_t;
      view_gen(False,2,Sender);              // ��������� ����������� ����� �����. (2)
      // �������� �������� ������
      if not TryStrToFloat(Edit4.Text, x) then
      begin
      if fl_5 then                           // ��� ���� ��� �� �������� ���� ������ ����� 1 ��� (� ��������� ������ ����������� ����� ���)
      begin
        fl_5:=False;
        ShowMessage('������ �����������');
      end;
      end else
      begin
      fl_5:=True;
      amp_t:=StrToFloat(Edit4.Text)*mant_a_t;// ��������� ��������� ������������
      end;
    end;

 if CheckBox1.Checked or CheckBox2.Checked then
  begin
    if CheckBox1.Checked then                 // ��������� ������
    begin
      view_gen(True,1,Sender);                // ���������� ����������� ����� ���.(1)
      y_sin:=amp_s*sin(2*pi*freq*t+faz);
      t:=t+dt;
    end;

    if CheckBox2.Checked then                 // ��������� ������������
    begin
      view_gen(True,2,Sender);                // ���������� ����������� ����� �����.(2)
      if tt < (1/(2*freq))  then              // ������������ ������� �����������
        y_t:=y_t-4*amp_t*freq*dt;
      if tt >= (1/(2*freq)) then              // ������������ ������� �����������
        y_t:=y_t+4*amp_t*freq*dt;
      if tt>= 1/(freq)-dt then                   // ����� ���������� ����� ��������� ������ �������
      begin                                   // ����� ���������� ��������� ������������ �������
        tt:=0;                                // ����� ������� ���������� ���� ��������� ������������ �������
        y_t:=amp_t;
      end;
      tt:=tt+dt;                              // �������������� ���������� ������������� �� �������� ����
    end;

 // ������������ ��������� �������
    if  CheckBox1.Checked and CheckBox2.Checked then
      y_out:=y_sin+y_t                        // �������
    else if CheckBox1.Checked then
      y_out:=y_sin                            // �����
    else if CheckBox2.Checked then
      y_out:=y_t;                             // �����������
 /////////////////////////////////////////
  end else
  begin
      y_out:=0;
  end;
// ���������� ��������������������� �������� �������
  if i< DR then                        // ���������� ����, ��� ������������ ����� �������� (��������� ��������)
  begin
    kv:=y_out*y_out;                   // �������� � �������
    sum:=sum+kv*dt;                    // ����������� ��������� ����������
  end else
  begin
    sk:=sqrt(freq*sum);                // ������� ��������������
    Edit6.Text:=FloatToStr(sk);        // ������� � ����
    if i>=DR then                      // ��������� ��������
    begin
      i:=-1;
      sum:=0;
    end;  
  end;
  i:=i+1;                              // ����������� ���������� ��������
////////////////////////////////////////////////////////////////////
end;



procedure TForm1.Button2Click(Sender: TObject);
begin
  x:=0;
// ���������� ���/���� ������������ ����� �������
  if fl_2 then                             // �������� �����
  begin
    chart1.Serieslist[0].Clear ;           // ������� �������
    // ������������� ���������� �����
    AssignFile(tempfile, 'C:\temp.txt');   // �������������� ����� ����� � �������� ����������
    Rewrite(tempfile);                     // ������� ���������� �����
    view_os(False,Sender);
    /////////////////////////
    timer2.Enabled:=True;                  // �������� �����������
    fl_2:=False;                           // �������� �������� �����
    view_os(True,Sender);                  // ��������� ������ � ������� ����������
  end else
  begin
    timer2.Enabled:=False;                 // ��������� �����������
    fl_2:=True;                            // �������� �������� �����
    view_os(False,Sender);                 // ��������� ������ � ������� ����������
  end;
//////////////////////////

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
// �������������
  timer1.Enabled:=False;                 // ��������� ������ ����������� ��� �������
  timer2.Enabled:=False;                 // ��������� ������ ����������  ��� �������
  
  Chart1.LeftAxis.Automatic := False ;     // ���������� ������������ �� ��� �
  Chart1.BottomAxis.Automatic := False ;   // ���������� ������������ �� ��� �

  fl_1:=true;                            // ������������� ����� ���\���� ����������
  fl_2:=true;                            // ������������� ����� ���\���� ������������

  mant_a:=1;                             // ������������� ���������� ������ 
  mant_t:=1;
  mant_f:=1;
  mant_a_s:=1;
  mant_a_t:=1;

  y_out:=0;

  freq:=StrToFloat(Edit1.Text)*mant_f;   // ��������� �������
  dt:=1/(Freq*DR);                       // �������������� ����������� ������������ ��������

  view_os(True,Sender);                  // ��������� ������ � ������� ���������� �� ������� ������� ������������
end;

procedure TForm1.Timer3Timer(Sender: TObject);
var
  st:string;                    // �������� ����������
  Axsc_a_min,Axsc_a_max,                   // ���������� �������� �� ���� ���������,
  Axsc_t_min,Axsc_t_max                    // a(x) � t(y) ��������������
  :extended;
  x: Single;
begin
  if not (TryStrToFloat(Edit7.Text, x) and TryStrToFloat(Edit8.Text, x) and     // �������� �������� ������
  TryStrToFloat(Edit9.Text, x) and TryStrToFloat(Edit10.Text, x)) then
  begin
    if fl_3 then                           // ��� ���� ��� �� �������� ���� ������ ����� 1 ��� (� ��������� ������ ����������� ����� ���)
    begin
      fl_3:=False;
      ShowMessage('������ �����������');
    end;
  end else
  begin
  fl_3:=True;
  Axsc_a_min:=StrToFloat(Edit9.Text);      // ��������� ��������� �������� ��� ��� y
  Axsc_a_max:=StrToFloat(Edit10.Text);     //
  Axsc_t_min:=StrToFloat(Edit7.Text);      // ��������� ��������� �������� ��� ��� �
  Axsc_t_max:=StrToFloat(Edit8.Text);      //

  Chart1.LeftAxis.SetMinMax(Axsc_a_min,Axsc_a_max);//������ �������� �� ��� y
  Chart1.BottomAxis.SetMinMax(Axsc_t_min,Axsc_t_max);//������ �������� �� ��� x
  end;

case ComboBox4.ItemIndex of   // � ������������ �� ��������� ������� ��������
  0: st:='���';
  1: st:='��';
  2: st:='�';
end;
Chart1.BottomAxis.Title.Caption:=st; // ����������� ����������� ���
case ComboBox5.ItemIndex of   // � ������������ �� ��������� ������� ��������
  0: st:='���';
  1: st:='��';
  2: st:='�';
  3: st:='��';
  4: st:='��';
end;
Chart1.LeftAxis.Title.Caption:=st; // ����������� ����������� ���
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if Savedialog1.Execute                                       // �������� ������� ����������
  then Chart1.SaveToBitmapFile(savedialog1.FileName+'.bmp')  // ���������� �����������
  else Exit;
showmessage('������ ������� ��������');
end;

procedure TForm1.Button4Click(Sender: TObject);
var
outfile: TextFile;                                    // �������� ����������
st:string;                                            // ��������� ����������
begin
if Savedialog2.Execute                                // �������� ������� ����������
  then
  begin
  CloseFile(tempfile);                                // �������� ���������� �����
  Reset(tempfile);                                    // �������� ���������� ����� ��� ������
  AssignFile(outfile, savedialog2.FileName+'.txt');   // �������������� ����� ����� � �������� ����������
  Rewrite(outfile);                                   // ������� �����
  write(outfile, '����� [');                          // ������ ��������� � ����
  write(outfile,Chart1.BottomAxis.Title.Caption:3,']    ');  // 15 ��������
  write(outfile, '���������  [');
  writeln(outfile, Chart1.LeftAxis.Title.Caption:3,']');
  writeln(outfile, '_______________________________');             

  While not EOF(tempfile) do                          // ������ ������ ��������� ��������� ���������� ����� � �������� ����
  begin
  readln(tempfile, st);
  writeln(outfile, st);
  end;
  CloseFile(outfile);                                 // �������� ������
  CloseFile(tempfile);                                // 
  end else Exit;
showmessage('������ ������� ���������');
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
CloseFile(tempfile);                                 // ��������� ��������� ����
Erase(tempFile);                                     // ������� ��������� ����
end;

end.




